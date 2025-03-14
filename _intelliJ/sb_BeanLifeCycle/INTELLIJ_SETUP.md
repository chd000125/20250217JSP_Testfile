# 인텔리제이에서 프로젝트 설정하기

이 프로젝트를 인텔리제이에서 열 때 다음 단계를 따라 설정하세요.

## 1. 인텔리제이에서 프로젝트 열기

1. `File` > `Open` 메뉴를 선택합니다.
2. 프로젝트 폴더를 선택합니다.
3. `OK` 버튼을 클릭합니다.
4. 인텔리제이가 자동으로 Maven 프로젝트로 인식하고 필요한 설정을 로드합니다.

## 2. JDK 설정 확인

1. `File` > `Project Structure` (또는 `Ctrl+Alt+Shift+S`) 메뉴를 선택합니다.
2. `Project` 탭에서 `Project SDK`가 JDK 11로 설정되어 있는지 확인합니다.
3. `Project language level`이 `11`로 설정되어 있는지 확인합니다.
4. `Apply` 버튼을 클릭합니다.

## 3. Maven 설정 확인

1. `File` > `Settings` (또는 `Ctrl+Alt+S`) 메뉴를 선택합니다.
2. `Build, Execution, Deployment` > `Build Tools` > `Maven` 메뉴로 이동합니다.
3. `Maven home directory`가 올바르게 설정되어 있는지 확인합니다.
4. `JDK for importer`가 JDK 11로 설정되어 있는지 확인합니다.

## 4. 프로젝트 빌드 및 실행

1. 프로젝트 빌드:
   - Maven 탭에서 `Lifecycle` > `clean` > `package` 작업을 실행합니다.
   - 또는 상단 메뉴에서 `Build` > `Build Project` 선택합니다.
   
2. 애플리케이션 실행:
   - `src/main/java/com/example/beanlifecycledemo/BeanLifecycleDemoApplication.java` 파일을 엽니다.
   - 클래스 옆의 실행 버튼(녹색 삼각형)을 클릭하거나 `Shift+F10`을 눌러 애플리케이션을 실행합니다.

## 5. 문제 해결

### Maven 관련 오류가 발생하는 경우

1. Maven 설정 확인:
   - `File` > `Settings` > `Build, Execution, Deployment` > `Build Tools` > `Maven`
   - `Maven home directory`가 올바르게 설정되어 있는지 확인합니다.
   - `Local repository`가 올바르게 설정되어 있는지 확인합니다.

2. Maven 캐시 삭제:
   - `C:\Users\<사용자명>\.m2\repository` 디렉토리를 삭제합니다.
   - 인텔리제이를 재시작합니다.
   - 프로젝트를 다시 빌드합니다.

### JSP 관련 오류가 발생하는 경우

1. `src/main/webapp/WEB-INF/views` 디렉토리가 존재하는지 확인합니다.
2. `application.properties` 파일에 다음 설정이 있는지 확인합니다:
   ```properties
   spring.mvc.view.prefix=/WEB-INF/views/
   spring.mvc.view.suffix=.jsp
   ``` 