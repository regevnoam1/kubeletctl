.PHONY: all

all:
	go mod vendor;
	go fmt ./...;
	mkdir -p build;
	GOARCH=386 GOOS=linux go build -v -o build/kubeletctl_linux_386;
	GOARCH=amd64 GOOS=linux go build -v -o build/kubeletctl_linux_amd64;
	GOARCH=arm64 GOOS=linux go build -v -o build/kubeletctl_linux_arm64;
	GOARCH=386 GOOS=windows go build -v -o build/kubeletctl_windows_386.exe;
	GOARCH=amd64 GOOS=windows go build -v -o build/kubeletctl_windows_amd64.exe;
	GOARCH=386 GOOS=darwin go build -v -o build/kubeletctl_darwin_386;
	GOARCH=amd64 GOOS=darwin go build -v -o build/kubeletctl_darwin_amd64;
	GOARCH=arm64 GOOS=darwin go build -v -o build/kubeletctl_darwin_arm64;

docker:
	docker build . -t kubeletctl:latest

docker-release:
	docker build -t kubeletctl:release -f Dockerfile.latest .