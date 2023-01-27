PROJECT_NAME=karma8-discovery

depend:
	go install github.com/bufbuild/buf/cmd/buf@v1.4.0
	go install github.com/golang/protobuf/protoc-gen-go@v1.5.2
	go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@v1.2.0
	go install github.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-openapiv2@v2.10.0

build:
	buf generate \
		--path proto/${PROJECT_NAME}
	buf build -o ${PROJECT_NAME}.pb
	cp -R ${PROJECT_NAME}/* ./
	rm -f -d -r ./${PROJECT_NAME}

version: build
	sed 's/%version%/$(version)/g' ./${PROJECT_NAME}.swagger.json > ./${PROJECT_NAME}.swagger.json.new
	rm -f ./${PROJECT_NAME}.swagger.json
	mv ./${PROJECT_NAME}.swagger.json.new ./${PROJECT_NAME}.swagger.json

clear:
	rm -f ./*.pb.go
	rm -f ./*.pb
	rm -f ./*.json
	rm -f ./*.json.new
	rm -f -d -r ./servers
	rm -f -d -r ./namespaces
	rm -f -d -r ./files
	rm -f -d -r ./swagger
