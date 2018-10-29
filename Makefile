docker-build:
	docker-compose up -d
	docker build \
		-t ex-ms-kotlin-boilerplate \
		--network=ex-ms-kotlin-boilerplate_default \
		--no-cache \
		--rm=true \
		--force-rm=true \
		--build-arg KOTLIN_BOILERPLATE_FLUENTD_HOST=fluentd \
	  	--build-arg KOTLIN_BOILERPLATE_FLUENTD_PORT=24224 \
		.
	docker-compose down

docker-run: docker-start
docker-start:
	docker-compose up -d
	docker run -d \
		-p 8080:8080 \
		--network=ex-ms-kotlin-boilerplate_default \
		--name=ex-ms-kotlin-boilerplate_main \
		ex-ms-kotlin-boilerplate

docker-stop:
	docker stop ex-ms-kotlin-boilerplate_main || true
	docker rm ex-ms-kotlin-boilerplate_main || true
	docker-compose down

docker-restart:
	make docker-stop 2>/dev/null || true
	make docker-start