# Example Kotlin Spring Microservice - Boilerplate
This is a repository containing a mostly empty Kotlin / Spring microservice.

## Modifying this microservice
Open `BoilerplateController.kt` and add begin adding your own logic.

## Building and running this microservice
Run the following commands at a Bash prompt:

```sh
./gradlew --no-daemon build
java -Dserver.tomcat.protocol-header=x-forwarded-proto -Dserver.tomcat.remote-ip-header=x-forwarded-for -jar build/libs/ex-ms-kotlin-boilerplate-0.0.1-SNAPSHOT.jar
```

You can alternatively build and run Docker containers:

```sh
make docker-build
make docker-run
```

## License
The repository utilizes code licensed under the terms of the Apache Software License and therefore is licensed under ASL v2 or later.

This source code in this repository is free: you can redistribute it and/or modify it under
the terms of the Apache Software License version 2, or (at your option) any later version.

This source code in this repository is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE. See the Apache Software License for more details.

You should have received a copy of the Apache Software License along with this program. If not, see https://www.apache.org/licenses/LICENSE-2.0.html.

The source code forked from other open source projects will inherit its license.
