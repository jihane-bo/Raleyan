#!/bin/bash

# Script pour consolider les fichiers communs identifiés

echo "Consolidation des fichiers communs..."

# 1. Consolider les fichiers communs (favicon, ajax-loader, larx)
echo "Déplacement des fichiers communs vers common/images..."

# Créer le dossier s'il n'existe pas
mkdir -p assets-optimized/common/images

# Copier un exemplaire de chaque fichier commun (prendre celui de raleyan comme référence)
cp assets-optimized/images/raleyan/favicon.png assets-optimized/common/images/
cp assets-optimized/images/raleyan/favicon.ico assets-optimized/common/images/
cp assets-optimized/images/raleyan/ajax-loader.gif assets-optimized/common/images/
cp assets-optimized/images/raleyan/larx.png assets-optimized/common/images/

echo "Fichiers communs consolidés :"
ls -la assets-optimized/common/images/

# 2. Créer un fichier CSS commun pour les parties partagées
echo "Création d'un fichier CSS commun..."

cat > assets-optimized/common/css/common.css << 'EOF'
/* Styles communs à toutes les marques - Raleyan Concept Store */

/* Variables CSS pour la cohérence */
:root {
    --primary-font: 'Open Sans', sans-serif;
    --secondary-font: 'Raleway', sans-serif;
    --transition-duration: 0.3s;
}

/* Reset et styles de base communs */
* {
    box-sizing: border-box;
}

body {
    font-family: var(--primary-font);
    line-height: 1.6;
}

/* Styles pour le preloader commun */
#preloader {
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background-color: #fff;
    z-index: 9999;
}

.preloader-container {
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
}

/* Spinner animation */
.spinner {
    width: 70px;
    text-align: center;
}

.spinner > div {
    width: 18px;
    height: 18px;
    background-color: #333;
    border-radius: 100%;
    display: inline-block;
    animation: sk-bouncedelay 1.4s infinite ease-in-out both;
}

.spinner .bounce1 {
    animation-delay: -0.32s;
}

.spinner .bounce2 {
    animation-delay: -0.16s;
}

@keyframes sk-bouncedelay {
    0%, 80%, 100% {
        transform: scale(0);
    } 40% {
        transform: scale(1.0);
    }
}

/* Styles communs pour les boutons */
.btn-common {
    transition: all var(--transition-duration) ease;
    border-radius: 3px;
    padding: 10px 20px;
    font-weight: 600;
    text-transform: uppercase;
}

/* Styles communs pour les sections */
.section-padding {
    padding: 80px 0;
}

/* Styles communs pour les titres */
.section-title {
    font-family: var(--secondary-font);
    font-weight: 300;
    margin-bottom: 50px;
}

/* Styles communs pour le footer */
.footer-common {
    background-color: #2c3e50;
    color: #fff;
    padding: 40px 0;
}

.footer-common a {
    color: #ecf0f1;
    transition: color var(--transition-duration) ease;
}

.footer-common a:hover {
    color: #3498db;
    text-decoration: none;
}

/* Responsive helpers communs */
@media (max-width: 768px) {
    .section-padding {
        padding: 40px 0;
    }
    
    .section-title {
        margin-bottom: 30px;
    }
}
EOF

echo "Fichier CSS commun créé : assets-optimized/common/css/common.css"

# 3. Créer un fichier JavaScript commun
echo "Création d'un fichier JavaScript commun..."

cat > assets-optimized/common/js/common.js << 'EOF'
/**
 * JavaScript commun à toutes les marques - Raleyan Concept Store
 */

$(document).ready(function() {
    
    // Configuration commune pour tous les sliders Owl Carousel
    var owlConfig = {
        loop: true,
        margin: 10,
        nav: true,
        autoplay: true,
        autoplayTimeout: 5000,
        responsive: {
            0: { items: 1 },
            600: { items: 2 },
            1000: { items: 3 }
        }
    };
    
    // Configuration commune pour le mobile menu
    var mobileMenuConfig = {
        extensions: ["pagedim-black"],
        navbar: {
            title: "Menu"
        },
        offCanvas: {
            position: "left",
            zposition: "front"
        }
    };
    
    // Initialisation du menu mobile s'il existe
    if ($(".mobile-menu").length) {
        $(".mobile-menu").mmenu(mobileMenuConfig);
    }
    
    // Gestion du preloader
    $(window).on('load', function() {
        $("#preloader").fadeOut(500);
    });
    
    // Smooth scrolling pour les ancres
    $('a[href*="#"]:not([href="#"])').click(function() {
        if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') 
            && location.hostname == this.hostname) {
            var target = $(this.hash);
            target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
            if (target.length) {
                $('html, body').animate({
                    scrollTop: target.offset().top - 70
                }, 1000);
                return false;
            }
        }
    });
    
    // Animation des compteurs si présents
    $('.counter').each(function() {
        var $this = $(this),
            countTo = $this.attr('data-count');
        
        $({ countNum: $this.text()}).animate({
            countNum: countTo
        }, {
            duration: 2000,
            easing: 'linear',
            step: function() {
                $this.text(Math.floor(this.countNum));
            },
            complete: function() {
                $this.text(this.countNum);
            }
        });
    });
    
    // Configuration AJAX commune
    $.ajaxSetup({
        cache: false,
        timeout: 10000
    });
    
});
EOF

echo "Fichier JavaScript commun créé : assets-optimized/common/js/common.js"

echo ""
echo "=== Résumé de la consolidation ==="
echo "✅ Fichiers images communs consolidés dans common/images/"
echo "✅ Fichier CSS commun créé : common/css/common.css"
echo "✅ Fichier JavaScript commun créé : common/js/common.js"
echo ""
echo "Pour optimiser davantage :"
echo "1. Incluez common.css avant les CSS spécifiques aux marques"
echo "2. Incluez common.js avant les JS spécifiques aux marques"  
echo "3. Mettez à jour les références vers les fichiers communs"
echo "4. Supprimez les fichiers dupliqués des dossiers de marques"

echo ""
echo "Consolidation terminée !"
