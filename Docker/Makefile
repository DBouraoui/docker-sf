.PHONY : build, send

build : 
	docker buildx build -t alpine .

send :
	docker run -p 80:80  -it --rm --name alpinec alpine

go:
	docker rmi alpine:latest && make build && make send