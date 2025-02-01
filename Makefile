.PHONY : build, send

build : 
	docker buildx build -t unbuntu .

send :
	docker run -it --name ubuntuc ubuntu