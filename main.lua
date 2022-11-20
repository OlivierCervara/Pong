--Au début de mon programme la fonction love.load va etre appeller 
--et c'est elle qui chargera les images et les sons

positiony = 2 --Je déclare ma variable prenant la valeur 2

function love.load()
end

function love.update() --love.update manipule les variables
    positiony = positiony + 1
end

function love.draw() --love.draw dessine le jeu
    love.graphics.rectangle("fill", 1, positiony, 20, 80)
--Cette propriété nous permet de dessiner un rectangle rempli grace à "fill"
--Puis, respectivement x, y, largeur, hauteur
end

--Ici, je demande à mon programme de dessiner le rectangle avec comme paramètre y donc la hauteur de l'écran (et pas de l'objet)
--la variable positiony qui change au fil du temps puisque mon programme réalise sa boucle entre la fonction update et draw.
--Cela nous donne un rectangle qui descend à l'infini lorsque le programme est executé.