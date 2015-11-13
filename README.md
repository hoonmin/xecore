hoonmin/xecore
==============

XpressEngine의 기본 배포본인 XECore를 실행할 수 있는 도커 패키지.
본 이미지와 문서는 Docker 1.9를 기준으로 작성되었습니다.

## XpressEngine

XpressEngine은 누구나 쉽고 편하고 자유롭게 콘텐츠를 발행을 할 수 있도록 하기 위한 CMS(Content Management System)입니다.
XpressEngine is CMS(Content Management System) to freely publish your contents without efforts.

## 개발 환경 설정 (윈도우, 맥)

윈도우나 맥에서 도커 환경을 만들어 xecore를 실행하기 위해서는 Docker ToolBox를 설치하셔야 합니다.
아래 링크에서 환경에 맞는 패키지를 다운로드 받아 설치하시기 바랍니다.

https://www.docker.com/docker-toolbox

맥 사용자라면 homebrew를 사용하여 설치할 수도 있습니다.
```
brew install Caskroom/cask/dockertoolbox
```

toolbox 설치가 완료되었다면, 다음과 같이 개발용 도커 VM을 생성하여 사용할 수 있습니다.
```
# 도커 VM 생성
docker-machine create -d virtualbox xe

# 도커 VM 리스트 확인
docker-machine ls

# 도커 VM을 기본 도커 환경으로 지정 
eval $(docker-machine env xe)

# 이제 위 명령을 실행한 쉘에서 docker 명령을 수행할 수 있게 됩니다.
docker info
```

## Dockerfile

```
# 도커 이미지 생성 (To create a docker image)
docker build -t hoonmin/xecore:1.8.14 .

# 도커 이미지 실행 (To run the docker image)
docker run -it hoonmin/xecore:1.8.14
```

## docker-compose.yml

XpressEngine을 실제로 사용하기 위해서는 MySQL 데이터베이스가 필요합니다.
본 패키지에 포함된 `docker-compose.yml` 파일을 이용하여 간단히 XpressEngine을 설치하고 운영할 수 있습니다.

자세한 내용은 `docker-compose.yml` 파일을 참고하세요.

```
# 시작
docker-compose --x-networking --x-network-driver overlay up -d

# 실행 확인
docker-compose ps

# 정지
docker-compose stop

# 컨테이너 삭제
docker-compose rm
```

## XpressEngine 설정 (Setup the XpressEngine)

실행이 완료되면 웹브라우저로 설치 페이지에 접속합니다.
docker-machine을 이용하여 개발 환경을 꾸민 경우, 다음과 같이 접속 IP를 확인할 수 있습니다.

```
docker-machine env xe
```

- 웹브라우저로 설치 페이지에 접속합니다.
- 언어 선택 후 DB 설정을 다음과 같이 변경해줍니다.
  - 사용자 : xe
  - 암호 : xe
  - DB : xe
  - DB 주소 : xecore_db_1

