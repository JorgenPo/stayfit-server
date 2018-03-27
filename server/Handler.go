package server

import (
	"net/http"
	"fmt"
	"encoding/json"
	"github.com/pkg/errors"
	"strconv"
	"log"
)

type Handler struct {
	server *StayFitServer
	out http.ResponseWriter
	request *http.Request
}

type ErrorResponse struct {
	Status int32
	Message string
}

func (h Handler) Serve(port int) {
	http.HandleFunc("/get/browserCategories", func(writer http.ResponseWriter, request *http.Request) {
		writer.Header().Set("Content-Type", "application/json")

		h.out = writer
		h.request = request
		h.getBrowserCategories()
	})

	log.Fatal(http.ListenAndServe(fmt.Sprintf(":%d", port), nil))
}

// Получает категории от from до to
// from, to - url параметры
func (h Handler) getBrowserCategories() {
	log.Println("getBrowserCategories!")
	from, _, err := h.getIntParam("from", true)
	if err != nil {
		return
	}

	to, _, err := h.getIntParam("to", true)
	if err != nil {
		return
	}

	categories, err := h.server.GetBrowserCategories(from, to)
	if err != nil {
		log.Println(err.Error())
		h.handleError(ErrorResponse{Status:500, Message: "Internal Error"})
		return
	}

	response, err := json.Marshal(categories)
	if err != nil {
		log.Fatal(err.Error())
		h.handleError(ErrorResponse{Status:500, Message: "Internal Error"})
		return
	}

	h.out.Write(response)
}

func (h Handler) handleParamError(name string) {
	errResponse := ErrorResponse{Status:400, Message:fmt.Sprintf("Missing required url parameter '%s'", name)}

	h.handleError(errResponse)
}

func (h Handler) handleError(errResponse ErrorResponse) {
	js, err := json.Marshal(errResponse)
	if err != nil {
		return
	}

	h.out.Write(js)
}

func (h Handler) getIntParam(name string, required bool) (int, bool, error) {
	params, ok := h.request.URL.Query()[name]
	if (!ok || len(params) < 1) && required {
		h.handleParamError(name)
		return 0, false, errors.New("No parameter")
	}

	param, err := strconv.Atoi(params[0])
	if err != nil {
		errorResponse := ErrorResponse{
			Status:  400,
			Message: fmt.Sprintf("Parameter '%s' must be integer value", name),
		}

		h.handleError(errorResponse)
		return 0, true, err
	}

	return param, true, nil
}