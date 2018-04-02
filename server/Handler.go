package server

import (
	"net/http"
	"fmt"
	"encoding/json"
	"github.com/pkg/errors"
	"strconv"
	"log"
	"strings"
	"os"
	"io/ioutil"
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

		logRequest(request)

		h.out = writer
		h.request = request
		h.getBrowserCategories()
	})

	http.HandleFunc("/get/image/", func(writer http.ResponseWriter, request *http.Request) {
		writer.Header().Set("Content-Type", "image/jpeg")

		logRequest(request)

		h.out = writer
		h.request = request
		h.getImage()
	})
	
	log.Fatal(http.ListenAndServe(fmt.Sprintf(":%d", port), nil))
}

// Возвращает изображение jpeg,
// Само изображение должно быть передано в последнем фрагменте
// Возвращает image/jpeg, а не json, в случае ошибки возвращает
// статус 404
func (h Handler) getImage() {
	path := strings.Split(h.request.URL.Path, "/")

	imageName := path[len(path)- 1]

	log.Printf("GET %s", imageName)

	splitted := strings.Split(imageName, ".")
	extension := splitted[len(splitted) - 1]

	// TODO: Другие типы
	if extension != "jpg" {
		h.out.WriteHeader(404)
		return
	}

	file, err := os.Open(h.server.ServerConfig.ImagesDirectory + "/" + imageName)
	if err != nil {
		log.Printf("[getImage]:" + err.Error())

		h.out.WriteHeader(404)

		return
	}
	defer file.Close()

	data, err := ioutil.ReadAll(file)
	if err != nil {
		log.Printf("[getImage]:" + err.Error())

		h.out.WriteHeader(404)

		return
	}

	h.out.Write(data)
}

// Получает категории от from до to
// from, to - url параметры
func (h Handler) getBrowserCategories() {
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
		log.Println(err.Error())
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

	h.out.Header().Set("Content-Type", "application/json")
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

func logRequest(r *http.Request) {
	log.Printf("Client (%s) requesting %s", r.RemoteAddr, r.URL.Path)
}