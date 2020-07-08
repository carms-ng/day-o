const loadCarousel = () => {
    const carousel = document.querySelector('.carousel');

    if (carousel) {
        const carouselNav = carousel.querySelector('.carousel__nav');
        const carouselNavBtns = Array.from(carouselNav.children);
        const carouselSlider = carousel.querySelector('.carousel__slides')
        const carouselSlides = Array.from(carouselSlider.children);
        const slideWidth = carouselSlides[0].getBoundingClientRect().width;
        
        // position the slides
        const setSlides = (slide, index) => {
            slide.style.left = slideWidth * index + 'px';
        }
        carouselSlides.forEach(setSlides);
        
        const moveSlides = (targetIndex) => {
            carouselSlider.style.transform = `translateX(-${(targetIndex) * slideWidth}px)`;
        }
        const updateNav = (targetIndex, currentIndex) => {
            carouselNavBtns[currentIndex].classList.remove('active');
            carouselNavBtns[targetIndex].classList.add('active');
        }

        carouselNavBtns.forEach((btn, index) => {
            btn.addEventListener('click', (e) => {
                const activeBtn = carouselNav.querySelector('.active');
                const currentIndex = carouselNavBtns.findIndex(btn => btn === activeBtn);
                moveSlides(index);
                updateNav(index, currentIndex);
            })
        })

    }
}

export { loadCarousel };
