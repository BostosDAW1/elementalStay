<?php
session_start();
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Elemental-Stay</title>
    <link rel="stylesheet" href="./CSS/index.css">
    <link rel="stylesheet" href="./CSS/footer.css">
    <link rel="stylesheet" href="./CSS/header.css">
</head>
<body>
    <!-- ------------------------ NAV PRINCIPAL + OPCIONES --------------------- -->
    <nav>
        <div class="logo">
            <img src="img/logo.png" alt="Logo">
            <h1 class="logo-title">ELEMENTAL STAY</h1>
        </div>
        <ul>
            <li><a href="index.php" id="boton-superior"><b>INICIO</b></a></li>
            <li><a href="hoteles/hoteles.html" id="boton-superior"><b>HOTELES</b></a></li>
            <li><a href="contactos/contactos.html" id="boton-superior"><b>CONTACTO</b></a></li>

            <!-- Aquí verificamos si la sesión está activa -->
            <?php if (isset($_SESSION['usuario'])): ?>
                <!-- Mostrar 'PERFIL' si la sesión está activa -->
                <li class="profile">
                    <a href="javascript:void(0);" onclick="toggleProfileMenu(event)" id="profileButton"><b>PERFIL</b></a>
                    <!-- Menú desplegable de opciones de perfil -->
                    <div class="profile-menu" id="profileMenu">
                        <a href="./perfil/perfil.php">Ver Perfil</a>
                        <a href="./inicio_session/logout.php" class="logout">Cerrar Sesión</a>
                    </div>
                </li>
            <?php else: ?>
                <!-- Si no hay sesión activa, mostrar el botón de "Iniciar sesión" -->
                <li><a href="../mp10/inicio_session/inicio_session.php" id="boton-superior"><b>INICIAR SESIÓN</b></a></li>
            <?php endif; ?>
        </ul>
    </nav>

    <script>
        // Función para alternar la visibilidad del menú de perfil
        function toggleProfileMenu(event) {
            event.stopPropagation();  // Evita que el clic se propague a otras partes de la página
            var menu = document.getElementById('profileMenu');
            menu.classList.toggle('show');  // Alterna la clase 'show' para mostrar/ocultar el menú
        }

        // Cerrar el menú si se hace clic fuera de él
        window.onclick = function(event) {
            // Verificamos si el clic NO fue sobre el enlace 'PERFIL' ni el menú desplegable
            if (!event.target.matches('#profileButton') && !event.target.matches('.profile-menu') && !event.target.closest('.profile')) {
                var dropdowns = document.getElementsByClassName('profile-menu');
                for (var i = 0; i < dropdowns.length; i++) {
                    var openDropdown = dropdowns[i];
                    if (openDropdown.classList.contains('show')) {
                        openDropdown.classList.remove('show');  // Oculta el menú
                    }
                }
            }
        }
    </script>







    
    <!-- -------------------------------------- CONTENEDOR PRINCIPAL --------------------------- -->
    <section>
        <div class="container">
            <!-- --------------- IMAGEN - SECCION CONTENEDOR PRINCIPAL ------------- -->
            <div class="text-section">
                <img src="./img/hotelPrincipal2.jpg" alt="fotoprincipal">
            </div>
            
            <!-- --------------------- FORMULARIO - SECCION CONTENEDOR PRINCIPAL ------------------- -->
            <div class="form-section">
                <form action="./Reserva/reserva.html">
                    <div class="form-group">
                        <label for="destino"><b>¿Adónde vas?</b></label>
                        <input type="text" name="destino" id="destino" required>
                    </div>
                
                    <!-- Campos de fecha debajo del destino -->
                    <div class="form-group">
                        <label for="entrada"><b>Fecha de entrada</b></label>
                        <input type="date" id="entrada" name="entrada" required>
                    </div>
                
                    <div class="form-group">
                        <label for="salida"><b>Fecha de salida</b></label>
                        <input type="date" id="salida" name="salida" required>
                    </div>
                
                    <!-- Sección de selección de personas y habitaciones -->
                    <div class="form-group">
                        <label><b>Adultos</b></label>
                        <input type="number" id="adultos" name="adultos" value="1" min="1">
                    </div>
                
                    <div class="form-group">
                        <label><b>Niños</b></label>
                        <input type="number" id="ninos" name="ninos" value="0" min="0">
                    </div>
                
                    <div class="form-group">
                        <label><b>Habitaciones</b></label>
                        <input type="number" id="habitaciones" name="habitaciones" value="1" min="1">
                    </div>
                
                    <!-- Interruptor para mascotas -->
                    <div class="form-group">
                        <label for="mascotas"><b>¿Viajas con mascotas?</b></label>
                        <input type="checkbox" id="mascotas" name="mascotas">
                        <p>Los animales de servicio no se consideran mascotas.</p>
                        <a href="#">Más info sobre viajar con animales de servicio</a>
                    </div>
                
                    <button type="submit">Confirmar</button>
                </form>
                
            </div>
        </div>
    </section>

    <!------------------- Carrusel -------------------->
    <section>
        <!------------------- Primer carrusel -------------------->
        <div class="chromatic-container">
            <h5 class="tituloPromociones">PROMOCIONES</h5>
        </div>
    
        <div class="slideshow-container" id="carrusel1">
            <div class="mySlides fade">
                <div class="numbertext">1 / 4</div>
                <img src="images/s1.jpg" style="width:100%" alt="imgCarrusel">
                <div class="text">Caption Text</div>
            </div>
    
            <div class="mySlides fade">
                <div class="numbertext">2 / 4</div>
                <img src="images/s2.jpg" style="width:100%" alt="imgCarrusel">
                <div class="text">Caption Two</div>
            </div>
    
            <div class="mySlides fade">
                <div class="numbertext">3 / 4</div>
                <img src="images/s3.jpg" style="width:100%" alt="imgCarrusel">
                <div class="text">Caption Three</div>
            </div>
    
            <div class="mySlides fade">
                <div class="numbertext">4 / 4</div>
                <img src="images/s4.jpg" style="width:100%" alt="imgCarrusel">
                <div class="text">Caption Four</div>
            </div>
    
            <a class="prev" onclick="plusSlides(-1, 'carrusel1')">❮</a>
            <a class="next" onclick="plusSlides(1, 'carrusel1')">❯</a>
        </div>

        <br>
        <br>
        <br>
    
        <!------------------- Segundo carrusel -------------------->
        <div class="chromatic-container2">
            <h5 class="tituloPromociones">ACTIVIDADES</h5>
        </div>
    
        <div class="slideshow-container" id="carrusel2">
            <div class="mySlides fade">
                <div class="numbertext">1 / 4</div>
                <img src="images/a5.jpeg" style="width:100%" alt="imgCarrusel">
                <div class="text">Caption Text</div>
            </div>
    
            <div class="mySlides fade">
                <div class="numbertext">2 / 4</div>
                <img src="images/a6.jpeg" style="width:100%" alt="imgCarrusel">
                <div class="text">Caption Two</div>
            </div>
    
            <div class="mySlides fade">
                <div class="numbertext">3 / 4</div>
                <img src="images/a7.jpeg" style="width:100%" alt="imgCarrusel">
                <div class="text">Caption Three</div>
            </div>
    
            <div class="mySlides fade">
                <div class="numbertext">4 / 4</div>
                <img src="images/a8.jpeg" style="width:100%" alt="imgCarrusel">
                <div class="text">Caption Four</div>
            </div>
    
            <a class="prev" onclick="plusSlides(-1, 'carrusel2')">❮</a>
            <a class="next" onclick="plusSlides(1, 'carrusel2')">❯</a>
        </div>
    </section>

   <!------------------- APARTADO HTML - FOOTER ------------------>
    <footer>
        <div class="footer-container">
            <div class="footer-section">
                <h4>Sobre Nosotros</h4>
                <p>Elemental Stay es tu plataforma para encontrar los mejores alojamientos al mejor precio, con opciones personalizadas para cada tipo de viajero.</p>
            </div>
            <div class="footer-section">
                <h4>Enlaces Útiles</h4>
                <ul>
                    <li><a href="#">Inicio</a></li>
                    <li><a href="#">Acerca de</a></li>
                    <li><a href="#">Contacto</a></li>
                    <li><a href="#">Términos y Condiciones</a></li>
                </ul>
            </div>
            <div class="footer-section">
                <h4>Síguenos</h4>
                <div class="social-icons">
                    <a href="#"><img src="icon-facebook.svg" alt="Facebook"></a>
                    <a href="#"><img src="icon-twitter.svg" alt="Twitter"></a>
                    <a href="#"><img src="icon-instagram.svg" alt="Instagram"></a>
                    <a href="#"><img src="icon-youtube.svg" alt="YouTube"></a>
                </div>
            </div>
        </div>
        <div class="footer-bottom">
            <p>&copy; 2024 Elemental Stay. Todos los derechos reservados.</p>
        </div>
    </footer>

    <script src="JS/Carrusel.js"></script>
    <script src="JS/Header.js"></script>

    
</body>
</html>