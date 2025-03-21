// Seleccionar elementos necesarios
document.addEventListener('DOMContentLoaded', function() {
  const dropdownButton = document.querySelector('.dropdown .polar-button');
  const dropdownContent = document.querySelector('.dropdown-content');
  
  // Crear un elemento overlay para oscurecer el fondo
  const overlay = document.createElement('div');
  overlay.className = 'page-overlay';
  document.body.appendChild(overlay);

  // Función para mostrar el menú y el overlay
  function showDropdown() {
    dropdownContent.classList.add('active');
    overlay.classList.add('active');
  }

  // Función para ocultar el menú y el overlay
  function hideDropdown() {
    dropdownContent.classList.remove('active');
    overlay.classList.remove('active');
  }

  // Evento al pasar el ratón sobre el botón
  dropdownButton.addEventListener('mouseenter', showDropdown);
  
  // Evento al quitar el ratón del dropdown completo
  const dropdown = document.querySelector('.dropdown');
  dropdown.addEventListener('mouseleave', hideDropdown);
  
  // Cerrar el menú al hacer clic en el overlay
  overlay.addEventListener('click', hideDropdown);
});

// Carrusel de testimonios
document.addEventListener('DOMContentLoaded', function() {
    const slider = document.querySelector('.testimonios-slider');
    const prevBtn = document.querySelector('.control-prev');
    const nextBtn = document.querySelector('.control-next');
    const indicadores = document.querySelectorAll('.indicador');
    
    // Check if elements exist before proceeding
    if (!slider || !prevBtn || !nextBtn) {
        console.error('Slider elements not found');
        return;
    }
    
    let currentSlide = 0;
    const slideCount = document.querySelectorAll('.testimonio').length || 5;
    let slideInterval;
    
    // Inicializar el carrusel
    function initCarousel() {
        // Establecer el ancho correcto para el slider
        slider.style.width = `${slideCount * 100}%`;
        
        // Iniciar el deslizamiento automático
        startAutoSlide();
    }
    
    function goToSlide(n) {
        currentSlide = (n + slideCount) % slideCount;
        const offset = -currentSlide * (100 / slideCount);
        slider.style.transform = `translateX(${offset}%)`;
        
        // Actualizar indicadores
        indicadores.forEach((ind, i) => {
            ind.classList.toggle('activo', i === currentSlide);
        });
    }
    
    function nextSlide() {
        goToSlide(currentSlide + 1);
    }
    
    function prevSlide() {
        goToSlide(currentSlide - 1);
    }
    
    function startAutoSlide() {
        // Clear any existing interval first
        stopAutoSlide();
        // Cambiar cada 2 segundos (2000 ms)
        slideInterval = setInterval(nextSlide, 2000);
    }
    
    function stopAutoSlide() {
        if (slideInterval) {
            clearInterval(slideInterval);
        }
    }
    
    // Event listeners para los botones de control
    nextBtn.addEventListener('click', () => {
        nextSlide();
        stopAutoSlide();
        startAutoSlide(); // Reiniciar el temporizador
    });
    
    prevBtn.addEventListener('click', () => {
        prevSlide();
        stopAutoSlide();
        startAutoSlide(); // Reiniciar el temporizador
    });
    
    // Event listeners para los indicadores
    indicadores.forEach((ind, i) => {
        ind.addEventListener('click', () => {
            goToSlide(i);
            stopAutoSlide();
            startAutoSlide(); // Reiniciar el temporizador
        });
    });
    
    // Pausar el deslizamiento automático cuando el mouse está sobre el carrusel
    slider.addEventListener('mouseenter', stopAutoSlide);
    slider.addEventListener('mouseleave', startAutoSlide);
    
    // Inicializar el carrusel
    initCarousel();
    
    // Log to confirm initialization
    console.log('Testimonial carousel initialized with', slideCount, 'slides');
});
// Slider principal
document.addEventListener('DOMContentLoaded', function() {
  // Slider principal
  const slides = document.querySelectorAll('.slide');
  const indicators = document.querySelectorAll('.slider-indicators .indicator');
  const prevBtn = document.querySelector('.slider-control-left');
  const nextBtn = document.querySelector('.slider-control-right');
  let currentSlide = 0;
  let slideInterval;

  // Función para mostrar un slide específico
  function showSlide(index) {
      // Remover clase active de todos los slides e indicadores
      slides.forEach(slide => slide.classList.remove('active'));
      indicators.forEach(indicator => indicator.classList.remove('active'));
      
      // Añadir clase active al slide e indicador actual
      slides[index].classList.add('active');
      indicators[index].classList.add('active');
      
      // Actualizar el índice del slide actual
      currentSlide = index;
  }

  // Función para ir al siguiente slide
  function nextSlide() {
      let nextIndex = currentSlide + 1;
      if (nextIndex >= slides.length) {
          nextIndex = 0;
      }
      showSlide(nextIndex);
  }

  // Función para ir al slide anterior
  function prevSlide() {
      let prevIndex = currentSlide - 1;
      if (prevIndex < 0) {
          prevIndex = slides.length - 1;
      }
      showSlide(prevIndex);
  }

  // Iniciar el intervalo para cambiar automáticamente
  function startSlideInterval() {
      slideInterval = setInterval(nextSlide, 3000);
  }

  // Detener el intervalo cuando el usuario interactúa
  function stopSlideInterval() {
      clearInterval(slideInterval);
  }

  // Reiniciar el intervalo después de la interacción
  function resetSlideInterval() {
      stopSlideInterval();
      startSlideInterval();
  }

  // Event listeners para los botones de navegación
  prevBtn.addEventListener('click', function() {
      prevSlide();
      resetSlideInterval();
  });

  nextBtn.addEventListener('click', function() {
      nextSlide();
      resetSlideInterval();
  });

  // Event listeners para los indicadores
  indicators.forEach((indicator, index) => {
      indicator.addEventListener('click', function() {
          showSlide(index);
          resetSlideInterval();
      });
  });

  // Iniciar el slider
  startSlideInterval();
});



document.addEventListener('DOMContentLoaded', function() {
    const categoriaContainer = document.querySelector('.grid-categorias');
    const categoriaItems = document.querySelectorAll('.categoria-item');
    const categoriaPrevBtn = document.querySelector('.categoria-control-left');
    const categoriaNextBtn = document.querySelector('.categoria-control-right');
    
    if (!categoriaContainer || !categoriaItems.length || !categoriaPrevBtn || !categoriaNextBtn) {
        console.error('Category carousel elements not found');
        return;
    }

    let currentCategoria = 0;
    const totalCategorias = categoriaItems.length;
    const itemsPerView = 1; // Número de categorías visibles a la vez
    const itemWidth = 40 / itemsPerView;
    let autoSlideInterval;

    // Clonar elementos para desplazamiento infinito
    const originalItems = Array.from(categoriaItems);
    originalItems.forEach(item => categoriaContainer.appendChild(item.cloneNode(true)));
    originalItems.forEach(item => categoriaContainer.appendChild(item.cloneNode(true))); // Doble clonación para suavidad
    
    const allItems = document.querySelectorAll('.categoria-item');
    const totalItems = allItems.length;

    // Configuración inicial
    categoriaContainer.style.width = `${totalItems * itemWidth}%`;
    categoriaContainer.style.transform = `translateX(0%)`;

    function updateCarousel(index, instant = false) {
        currentCategoria = index % totalCategorias;
        const offset = -currentCategoria * itemWidth;
        
        categoriaContainer.style.transition = instant ? 'none' : 'transform 0.5s ease';
        categoriaContainer.style.transform = `translateX(${offset}%)`;

        // Reset suave cuando llega al final
        if (index >= totalCategorias) {
            setTimeout(() => {
                categoriaContainer.style.transition = 'none';
                currentCategoria = 0;
                categoriaContainer.style.transform = `translateX(0%)`;
            }, 500);
        }
    }

    function nextCategoria() {
        currentCategoria++;
        updateCarousel(currentCategoria);
    }

    function prevCategoria() {
        currentCategoria--;
        if (currentCategoria < 0) currentCategoria = totalCategorias - 1;
        updateCarousel(currentCategoria);
    }

    function startAutoSlide() {
        stopAutoSlide();
        autoSlideInterval = setInterval(nextCategoria, 3000); // 3 segundos como los testimonios
    }

    function stopAutoSlide() {
        if (autoSlideInterval) {
            clearInterval(autoSlideInterval);
        }
    }

    // Controles manuales
    categoriaNextBtn.addEventListener('click', () => {
        nextCategoria();
        stopAutoSlide();
        startAutoSlide(); // Reinicia el temporizador
    });

    categoriaPrevBtn.addEventListener('click', () => {
        prevCategoria();
        stopAutoSlide();
        startAutoSlide(); // Reinicia el temporizador
    });

    // Pausar al pasar el mouse
    categoriaContainer.addEventListener('mouseenter', stopAutoSlide);
    categoriaContainer.addEventListener('mouseleave', startAutoSlide);

    // Inicialización
    updateCarousel(currentCategoria, true);
    startAutoSlide();
    console.log('Category carousel initialized with', totalCategorias, 'original categories');
});
        // Cargar el footer dinámicamente
       // Función para cargar un archivo HTML en un contenedor
       // Modify the loadComponent function to initialize dropdown after loading
       function loadComponent(url, containerId) {
           fetch(url)
               .then(response => {
                   if (!response.ok) {
                       throw new Error(`No se pudo cargar ${url}`);
                   }
                   return response.text();
               })
               .then(data => {
                   document.getElementById(containerId).innerHTML = data;
                   
                   // Initialize dropdown functionality if this is the header
                   if (containerId === "header-container") {
                       initializeDropdown();
                       
                       // Make header sticky
                       const headerContainer = document.getElementById(containerId);
                       headerContainer.style.position = "sticky";
                       headerContainer.style.top = "0";
                       headerContainer.style.zIndex = "1000";
                   }
               })
               .catch(error => console.error("Error:", error));
       }

       // Function to initialize dropdown functionality
       function initializeDropdown() {
           const dropdownButton = document.querySelector('.dropdown .polar-button');
           const dropdownContent = document.querySelector('.dropdown-content');
           
           if (!dropdownButton || !dropdownContent) {
               console.error('Dropdown elements not found');
               return;
           }
           
           // Create overlay if it doesn't exist
           let overlay = document.querySelector('.page-overlay');
           if (!overlay) {
               overlay = document.createElement('div');
               overlay.className = 'page-overlay';
               document.body.appendChild(overlay);
           }
       
           // Function to show the menu and the overlay
           function showDropdown() {
               dropdownContent.classList.add('active');
               overlay.classList.add('active');
           }
       
           // Function to hide the menu and the overlay
           function hideDropdown() {
               dropdownContent.classList.remove('active');
               overlay.classList.remove('active');
           }
       
           // Event listeners
           dropdownButton.addEventListener('mouseenter', showDropdown);
           
           const dropdown = document.querySelector('.dropdown');
           dropdown.addEventListener('mouseleave', hideDropdown);
           
           overlay.addEventListener('click', hideDropdown);
       }
       
       // Remove the original dropdown initialization code from the DOMContentLoaded event
       // and let the initializeDropdown function handle it after the header is loaded
    // Cargar Header y Footer
    loadComponent("../app/vista/layaouts/header.html", "header-container");
    loadComponent("../app/vista/layaouts/footer.html", "footer-container");

    $(document).ready(function () {
        $("#loginForm").submit(function (event) {
            event.preventDefault(); // Evita la recarga de la página
    
            let correo = $("#correo").val();
            let contrasena = $("#contrasena").val();
    
            $.ajax({
                type: "POST",
                url: "../../app/Controlador/LoginController.php",
                data: { correo: correo, contrasena: contrasena },
                dataType: "json",
                success: function (response) {
                    // Mostrar la respuesta en consola
                    console.log("Datos enviados:", {
                        correo: correo,
                        contrasena: contrasena
                    });
    
                    console.log("Respuesta del servidor:", response);
    
                    if (response.status === "success") {
                        alert(response.message);
                        window.location.href = "../../public/index.html"; // Redirigir al usuario
                    } else {
                        alert(response.message);
                    }
                },
                error: function (xhr, status, error) {
                    console.error("Error en la solicitud AJAX:", status, error);
                    console.error("Respuesta del servidor:", xhr.responseText);
                }
            });
        });
    });

    $(document).ready(function () {
        $("#RegistroForm").submit(function (event) {
            event.preventDefault(); // Evita la recarga de la página
    
            let nombre = $("#nombre").val();
            let apellido = $("#apellido").val();
            let correo = $("#correo").val();
            let contrasena = $("#contrasena").val();
            let direccion = $("#direccion").val();
            let telefono = $("#telefono").val().trim();

            $.ajax({
                type: "POST",
                url: "../../app/Controlador/RegisterController.php",
                data: { 
                    nombre:nombre, 
                    apellido: apellido,
                    correo: correo, 
                    contrasena: contrasena,
                    direccion: direccion,
                    telefono: telefono
                },
                dataType: "json",
                success: function (response) {
                    // Mostrar la respuesta en consola
                    console.log("Datos enviados:", {
                        nombre: nombre,
                        apellido: apellido,
                        correo: correo, 
                        contrasena: contrasena,
                        direccion: direccion,
                        telefono: telefono
                    });
    
                    console.log("Respuesta del servidor:", response);
    
                    if (response.status === "success") {
                        alert(response.message);
                        window.location.href = "../../public/index.html"; // Redirigir al usuario
                    } else {
                        alert(response.message);
                    }
                },
                error: function (xhr, status, error) {
                    console.error("Error en la solicitud AJAX:", status, error);
                    console.error("Respuesta del servidor:", xhr.responseText);
                }
            });
        });
    });