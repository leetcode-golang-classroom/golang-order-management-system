.PHONY=build

genproto:
	@protoc \
		--proto_path=protobuf "protobuf/orders.proto" \
		--go_out=services/common/genproto/orders --go_opt=paths=source_relative \
		--go-grpc_out=services/common/genproto/orders --go-grpc_opt=paths=source_relative

build-orders:
	@go build -o bin/orders services/orders/main.go services/orders/grpc.go services/orders/http.go 
build-kitchen:
	@go build -o bin/kitchen services/kitchen/main.go 

run-orders: build-orders
	@./bin/orders

test:
	@go test -v -cover ./test/...