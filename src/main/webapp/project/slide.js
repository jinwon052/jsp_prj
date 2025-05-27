/**
 * 
 */

/* 배너 1 영역*/

document.addEventListener("DOMContentLoaded", function () {
      const swiper = new Swiper('.main-banner-swiper', {
        loop: true,
        effect: 'fade',
        autoplay: {
          delay: 4000,
          disableOnInteraction: false
        }
      });

      const pageNow = document.getElementById('page-now');
      const pageTotal = document.getElementById('page-total');
      const realSlides = document.querySelectorAll('.main-banner-swiper .swiper-slide:not(.swiper-slide-duplicate)').length;
      pageTotal.textContent = realSlides;

      swiper.on('slideChange', () => {
        pageNow.textContent = (swiper.realIndex + 1).toString();
      });

      document.querySelector('.custom-prev').addEventListener('click', () => swiper.slidePrev());
      document.querySelector('.custom-next').addEventListener('click', () => swiper.slideNext());
    });

/* 배너 2 영역*/
document.addEventListener("DOMContentLoaded", function () {
  // 배너 2 영역
  const posterTrack2 = document.getElementById("poster2-track");
  const indexDisplay2 = document.getElementById("current-index");
  const prevBtn2 = document.getElementById("prev-btn");
  const nextBtn2 = document.getElementById("next-btn");

  const max2 = 10;
  let current2 = 1;
  let autoSlideTimer2 = null;
  const autoSlideDelay2 = 4000;

  function createPoster2(index, position) {
    const div = document.createElement("div");
    div.className = "poster2 " + position;
    const img = document.createElement("img");
    img.src = "/gungon/images/program/" + index + ".jpg";
    img.alt = "포스터 " + index;
    div.appendChild(img);
    return div;
  }

  function updatePosters2() {
    const next = current2 === max2 ? 1 : current2 + 1;
    posterTrack2.innerHTML = "";
    posterTrack2.appendChild(createPoster2(current2, "left"));
    posterTrack2.appendChild(createPoster2(next, "right"));
    posterTrack2.style.transform = "translateX(0px)";
    indexDisplay2.textContent = current2;
  }

  function slideTo2(direction) {
    const offset = direction === "next" ? -300 : 300;
    posterTrack2.style.transition = "transform 0.5s ease";
    posterTrack2.style.transform = "translateX(" + offset + "px)";
    setTimeout(function () {
      current2 = direction === "next"
        ? (current2 === max2 ? 1 : current2 + 1)
        : (current2 === 1 ? max2 : current2 - 1);
      posterTrack2.style.transition = "none";
      updatePosters2();
    }, 500);
  }

  function startAutoSlide2() {
    if (autoSlideTimer2) {
      clearTimeout(autoSlideTimer2);
    }
    autoSlideTimer2 = setTimeout(function () {
      slideTo2("next");
      startAutoSlide2();
    }, autoSlideDelay2);
  }

  prevBtn2.addEventListener("click", function () {
    slideTo2("prev");
    startAutoSlide2();
  });

  nextBtn2.addEventListener("click", function () {
    slideTo2("next");
    startAutoSlide2();
  });

  updatePosters2();
  startAutoSlide2();
});