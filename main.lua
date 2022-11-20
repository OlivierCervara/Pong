--Au début de mon programme la fonction love.load va etre appeller 
--et c'est elle qui chargera les images et les sons

function love.load()
end

function love.update() --love.update manipule les variables
end

function love.draw() --love.draw dessine le jeu
    love.graphics.rectangle("fill", 1, 1, 20, 80)
--Cette propriété nous permet de dessiner un rectangle rempli grace à "fill"
--Puis, respectivement x, y, largeur, hauteur
end