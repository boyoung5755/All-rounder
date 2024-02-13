/**
 * <pre>
 * 채팅 기능에서 사용하는 자바스크립트
 * 순수 자바스크립트 코드로 작성할 예정
 * </pre>
 * @author 박민주
 * @since 2023. 11. 12.
 * @version 1.0
 * <pre>
 * [[개정이력(Modification Information)]]
 * 수정일        수정자       수정내용
 * --------     --------    ----------------------
 * 2023. 11. 18. 박민주		최초작성
 * Copyright (c) 2023 by DDIT All right reserved
 * </pre>
 */

/**
 * UI Modals
   부트스트랩 커스텀
 */

'use strict';

(function () {
  // Animation Dropdown
  const animationDropdown = document.querySelector('#animation-dropdown'),
    animationModal = document.querySelector('#animationModal');
  if (animationDropdown) {
    animationDropdown.onchange = function () {
      animationModal.classList = '';
      animationModal.classList.add('modal', 'animate__animated', this.value);
    };
  }

  // Onboarding modal carousel height animation
  document.querySelectorAll('.carousel').forEach(carousel => {
    carousel.addEventListener('slide.bs.carousel', event => {
      // ! Todo: Convert to JS (animation) (jquery)
      var nextH = $(event.relatedTarget).height();
      $(carousel).find('.active.carousel-item').parent().animate(
        {
          height: nextH
        },
        500
      );
    });
  });
})();
