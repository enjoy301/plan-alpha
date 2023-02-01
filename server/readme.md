# [TEAM G] mybiseo-server

다음과 같은 기능이 포함되어 있습니다.

- 유저의 일정 기반으로 수면, 식사, 운동, 공부 등 **5가지 항목에 대해 평가**
- 이전 일정 + 유저의 피드백 기반으로 내일의 **일정 생성**
- AI 비서가 다양한 정보와 조언, 칭찬 제공

## 프로젝트에서 사용한 기술

- Docker, docker-compose로 서비스 컨테이너화
- typeDI로 Dependancy Injection, IoC 적용
- MVC pattern

## Dev Server 실행 방법

```
docker-compose up -d --build
```
