// Controladores para los índices de cada carrusel
let slideIndices = {};

// Inicializar carruseles
function initCarruseles() {
    const carruseles = document.querySelectorAll(".slideshow-container");
    carruseles.forEach(carrusel => {
        const id = carrusel.id;
        slideIndices[id] = 0; // Inicia cada carrusel en la primera diapositiva
        showSlides(id); // Muestra las diapositivas correspondientes

        // Avanza automáticamente cada 4 segundos
        setInterval(() => {
            plusSlides(1, id);
        }, 4000);
    });
}

// Mostrar diapositivas para un carrusel específico
function showSlides(carruselId) {
    const slides = document.querySelectorAll(`#${carruselId} .mySlides`);
    const slideIndex = slideIndices[carruselId];

    // Ocultar todas las diapositivas de este carrusel
    slides.forEach(slide => {
        slide.style.display = "none";
    });

    // Muestra la diapositiva actual
    slides[slideIndex].style.display = "block";
}

// Cambiar diapositivas con los botones de navegación
function plusSlides(n, carruselId) {
    const slides = document.querySelectorAll(`#${carruselId} .mySlides`);
    slideIndices[carruselId] += n;

    // Ajustar el índice dentro de los límites
    if (slideIndices[carruselId] >= slides.length) {
        slideIndices[carruselId] = 0;
    } else if (slideIndices[carruselId] < 0) {
        slideIndices[carruselId] = slides.length - 1;
    }

    showSlides(carruselId);
}

// Llama a la función de inicialización cuando cargue la página
window.onload = initCarruseles;
