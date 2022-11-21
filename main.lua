--Au début de mon programme la fonction love.load va etre appeller 
--et c'est elle qui chargera les images et les sons

pad = {} --Je déclare ma variable complexe qui est une table vide
pad.x = 0
pad.y = 0
pad.largeur = 20
pad.hauteur = 80

--Je mets tout cela dans des variables comme cela si je souhaite changer la taille de la raquette j'aurais juste à changer les valeurs directement ici.

function love.load()
end

function love.update() --love.update manipule les variables
    if love.keyboard.isDown("down") and pad.y + pad.hauteur < 600 then --je créé une condition spécifiant que SI la touche down du clavier est enfoncé ALORS la valeur y augmentera et donc la raquette descendra sur l'axe y de l'écran. On souhaite également que notre raquette ne dépasse pas les bordures de l'écran. Sachant que l'axe des y fait 600px, on doit pouvoir bloquer la descente de la raquette lorsque la limite est atteinte.
        pad.y = pad.y + 1                --La fonction love.keyboard.isDown("down") permet cela, le paramètre entre parenthèses spécifie la touche du clavier en question.
    end
    if love.keyboard.isDown("up") and pad.y > 0 then --Ici on souhaite que lorsque la touche haut est enfoncé notre raquette remonte sur l'axe des y polur se rapprocher de sa position initiale proche de 0.
        pad.y = pad.y - 1
    end

end

function love.draw() --love.draw dessine le jeu
    love.graphics.rectangle("fill", pad.x, pad.y, pad.largeur, pad.hauteur)
--Cette propriété nous permet de dessiner un rectangle rempli grace à "fill"
--Puis, respectivement x, y, largeur, hauteur
end

--Ici, je demande à mon programme de dessiner le rectangle avec comme paramètre y donc la hauteur de l'écran (et pas de l'objet)
--la variable positiony qui change au fil du temps puisque mon programme réalise sa boucle entre la fonction update et draw.
--Cela nous donne un rectangle qui descend à l'infini lorsque le programme est executé.