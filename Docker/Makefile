.PHONY : build, send, go, clean

build : 
	docker buildx build -t alpine .

send :
	docker run -p 80:80 -v ./sfapi:/var/www alpine

go:
	composer create-project symfony/skeleton:"7.2.x" sfapi && \
	make build && \
	make send

# Nettoie les conteneurs et images
clean:
	docker stop $(CONTAINER_NAME) || true
	docker rm $(CONTAINER_NAME) || true
	docker rmi $(IMAGE_NAME) || true