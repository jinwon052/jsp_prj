<%@ page contentType="text/html; charset=UTF-8" language="java" %>


<!-- 캐러셀 슬라이드 -->
<div class="swiper main-banner-swiper">
  <div class="swiper-wrapper">
<div class="custom-banner-controls">
  <div class="page-info"><span id="page-now">1</span>/<span id="page-total">5</span></div>
  <img src="http://192.168.10.72/jsp_prj/common/images/left-button.png" style="cursor: pointer;" class="custom-prev"/>
  <img src="http://192.168.10.72/jsp_prj/common/images/right-button.png" style="cursor: pointer;" class="custom-next"/>
</div>
    <div class="swiper-slide">
      <a href="palaceInfo.jsp?name=gyeongbokgung" class="slide-link">
        <div class="banner-slide" style="background-image: url('http://192.168.10.72/jsp_prj/common/images/gyeongbokgung.jpg');">
          <div class="banner-text" style="margin-left:200px">
            <p class="sub-title">Gyeongbokgung Palace</p>
            <h2>경복궁</h2>
          </div>
        </div>
      </a>
    </div>
    <div class="swiper-slide">
      <a href="palaceInfo.jsp?name=gyeonghuigung" class="slide-link">
        <div class="banner-slide" style="background-image: url('http://192.168.10.72/jsp_prj/common/images/gyeonghuigung.jpg');">
          <div class="banner-text" style="margin-left:200px">
            <p class="sub-title">Gyeonghuigung Palace</p>
            <h2>경희궁</h2>
          </div>
        </div>
      </a>
    </div>
    <div class="swiper-slide">
      <a href="palaceInfo.jsp?name=changdeokgung" class="slide-link">
        <div class="banner-slide" style="background-image: url('http://192.168.10.72/jsp_prj/common/images/changdeokgung.jpg');">
          <div class="banner-text" style="margin-left:200px">
            <p class="sub-title">Changdeokgung Palace</p>
            <h2>창덕궁</h2>
          </div>
        </div>
      </a>
    </div>
    <div class="swiper-slide">
      <a href="palaceInfo.jsp?name=changgyeonggung" class="slide-link">
        <div class="banner-slide" style="background-image: url('http://192.168.10.72/jsp_prj/common/images/changgyeonggung.jpg');">
          <div class="banner-text" style="margin-left:200px">
            <p class="sub-title">Changgyeonggung Palace</p>
            <h2>창경궁</h2>
          </div>
        </div>
      </a>
    </div>
    <div class="swiper-slide">
      <a href="palaceInfo.jsp?name=deoksugung" class="slide-link">
        <div class="banner-slide" style="background-image: url('http://192.168.10.72/jsp_prj/common/images/deoksugung.jpg');">
          <div class="banner-text" style="margin-left:200px">
            <p class="sub-title">Deoksugung Palace</p>
            <h2>덕수궁</h2>
          </div>
        </div>
      </a>
    </div>
  </div>
</div>
