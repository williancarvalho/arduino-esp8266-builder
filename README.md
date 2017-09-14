# Example to use

docker run -it --rm -v "$(pwd)/custom-libs/:/arduino-custom-libs" -v "$(pwd)/:/src" --workdir "/src" williancarvalho/arduino-esp8266-builder bash
