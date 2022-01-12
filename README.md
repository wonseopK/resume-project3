# 프로젝트의 구조 스케치
저는 어떻게 프로젝트를 계획해야 할지 생각이 잘 안날때는 이렇게 그림을 그리면 도움이 많이 되었습니다. 

<img src="https://user-images.githubusercontent.com/87956011/148166631-c2522014-c1ff-452c-abec-8b820d64f32d.jpg" style="width:500px; height:700px"/>

# 프로젝트 전반적인 계획
제가 원하는 구조는 먼저 타일즈를 이욯해서 메뉴바와 출력부분으로 나누고, 메뉴바에서는 자기소개, 프로젝트, 이메일 문의하기와 같이 3개의 기능으로 구성합니다.<br/> 그리고
각 메뉴 클릭시 해당 기능들이 출력 부분에 출력 되는데요 자기소개 세부 버튼으로는 깃허브와 개발 블로그로 이동할 수 있는 버튼이 있습니다. <br/>그 다음 프로젝트 버튼을 누르면
진행햇던 프로젝트를 볼수 있는 게시판으로 이동됩니다. 이때 게시글 등록 수정 삭제는 관리자인 저만 가능하게 하려고 합니다. 그리고 읽기 기능은 누구든지 볼수 있도록 하려고합니다

# 구현기능 계획
- 자기소개서, 프로젝트포트폴리오, 이메일전송 3개의 매뉴를 좌측화면에 구성
- 자기소개서 메뉴에 하위매뉴로 이름, 생년월일 정보, 깃허브 이동링크, 개발블로그 이동링크로 구성
- 메뉴에서 자기소개서 클릭 시 자기소개서 디테일 페이지로 이동
- 메뉴에서 프로젝트 클릭 시 진행했던 프로젝트를 볼 수있는 게시판으로 이동
- 프로젝트 게시판에서 글 작성, 수정, 삭제는 이력서 관리자만 가능하도록하기 위해서 버튼 클릭시 비밀번호 요구
- 관리자가 아닐경우 프로젝트 게시판에서 글의 내용을 확인 가능
- 썸머노트 에디터를 이용해서 글을 읽을때 시각적인 효과부여하고 이미지와 유튜브 영상을 첨부가능하도록 구성
- 메뉴에서 이메일 버튼을 클릭하면 문의 하시는 분의 이메일 주소를 작성하고 전송을 하면 이력서 관리자의 이메일로 발송되도록 구성

# 프로젝트 진행 중 발생한 여러 문제점 및 해결방안
# 문제 1
![image](https://user-images.githubusercontent.com/87956011/148191604-7774affc-db99-4363-a457-70b0f13d48de.png)
컨트롤러에 있는 로직을 서비스로 이동시켜야 할 부분이 많습니다.<br/>
# 해결
<br/>![image](https://user-images.githubusercontent.com/87956011/148196512-bb9deb44-3b03-4eb2-bf19-11c29967062f.png)<br/>
컨트롤러의 로직을 서비스로 이동시켜서 위의 사진에 보이는 양의 코드를 제거할 수 있었습니다. 코드의 중복제거는 프로젝트 유지보수에 도움이 많이되는 것 같습니다.

# 문제 2
<br/><br/>![image](https://user-images.githubusercontent.com/87956011/148191760-07aec21a-e2ae-472e-a58f-3f4712b555fd.png)<br/>
이렇게 model에 여러개 담아보내면 코드가 복잡해 보입니다. 그래서 새로 DTO를 만들고 @modelAttribute로 매개변수로 받아서 사용하려고 생각하고 있습니다.<br/>
# 해결
![image](https://user-images.githubusercontent.com/87956011/148372234-e4ed8b92-496f-49eb-86c8-5494e8eec609.png)<br/>
실제로 컨트롤러에 있던 코드들을 DTO로 이동시키고 DTO에 필드의 변수들을 원하는 값으로 초기화하는 메서드를 추가했습니다. 
<br/>그래서 컨트롤러로 페이징관련 요청이 매개변수로 필요한 값을 DTO로 넘겨주고 DTO의 페이징처리를 위한 맴버변수를 초기화 해주는 매서드를 실행시합니다<br/>
그 다음 DTO를 VIEW에 넘겨저서 해당 데이터를 사용해서 페이징 처리를 할 수 있도록 했습니다. 

# 문제 3
<br/><br/>![image](https://user-images.githubusercontent.com/87956011/148192358-51f66404-7c07-4095-9561-3bac9a4126a2.png)
프로젝트 게시판에서 페이지 이동시 화면이 깜빡 거리는데요 이 점을 고치기 위해서 ajax를 사용해서 페이지 이동시 부자연스러운 부분을 해결하려고 하고있습니다.

# 문제 4
![image](https://user-images.githubusercontent.com/87956011/148475025-4c7df03b-8fc3-40d0-8514-c0831dbbbd97.png)<br/>
메뉴선택시 이미지 깜빡거림 


# 해결
![image](https://user-images.githubusercontent.com/87956011/148475095-ebf9ef5b-4f91-41b4-8d22-6bbdcc37a506.png)<br/>

스프링정석 강좌에서 배웠던 base64가 기억나서 적용해보았습니다.
우선 이미지를 https://www.base64-image.de/ 사이트에서 base64로 인코딩 했습니다. base 64로 인코딩하면 utf 8 기준 크기가 약 33% 
증가하지만 서버에 요청할 필요없이 문서에 포함시킴으로써 이미지가 깜빡이는 것을 보안 할 수 있었습니다.

# 문제 5
  ![post](https://user-images.githubusercontent.com/87956011/149081877-a2d3cf2b-63ea-468d-8eee-84a67b9dad0d.JPG)
  ![delete](https://user-images.githubusercontent.com/87956011/149081885-942a228d-2fa6-477a-b18b-cb6f341c8535.JPG)


  자원을 효율 적으로 관리 하기 위한 restful 방식을 적용하고 싶었습니다.
  
# 해결
  ![r-post](https://user-images.githubusercontent.com/87956011/149081988-3eb5c5a8-25e7-407e-9580-69308c813a65.JPG)
  ![r-delete](https://user-images.githubusercontent.com/87956011/149081995-463fb700-ca24-42d6-8e36-7936532855d6.JPG)

  맵핑을 단순히 get post가아닌 목적에 맞게 변경해주고 url 또한 변경해주었습니다.
