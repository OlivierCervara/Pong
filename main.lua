--Au début de mon programme la fonction love.load va etre appeller 
--et c'est elle qui chargera les images et les sons

    --Raquette J1
pad = {} --Je déclare ma variable complexe qui est une table vide
pad.x = 0
pad.y = 0
pad.largeur = 20
pad.hauteur = 80

    --Raquette J2
pad2 = {}
pad2.x = 0
pad2.y = 0
pad2.largeur = 20
pad2.hauteur = 80

    --Balle
ball = {}
ball.x = 400
ball.y = 300
ball.largeur = 20
ball.hauteur = 20
ball.vitesse_x = 2
ball.vitesse_y = 2

    --Score
score_joueur1 = 0
score_joueur2 = 0

--Je mets tout cela dans des variables comme cela si je souhaite changer la taille de la raquette j'aurais juste à changer les valeurs directement ici.

function CentreBalle()
    ball.x = love.graphics.getWidth() / 2 --La balle n'étant pas au centre de l'écran par défaut nous allons l'initialiser dans la fonction load
    ball.x = ball.x - ball.largeur / 2

    ball.y = love.graphics.getHeight() / 2
    ball.y = ball.y - ball.hauteur / 2
    
    ball.vitesse_x = 2
    ball.vitesse_y = 2
    
    pad.x = 0
    pad.y = 0
    
    pad2.x = love.graphics.getWidth() - pad2.largeur
    pad2.y = love.graphics.getHeight() - pad2.hauteur
end

function love.load()

    CentreBalle()

end

function love.update() --love.update manipule les variables

    --Raquette J1
    if love.keyboard.isDown("q") and pad.y < love.graphics.getHeight() - pad.hauteur then --je créé une condition spécifiant que SI la touche down du clavier est enfoncé ALORS la valeur y augmentera et donc la raquette descendra sur l'axe y de l'écran. On souhaite également que notre raquette ne dépasse pas les bordures de l'écran. Sachant que l'axe des y fait 600px, on doit pouvoir bloquer la descente de la raquette lorsque la limite est atteinte.
        pad.y = pad.y + 3                --La fonction love.keyboard.isDown("down") permet cela, le paramètre entre parenthèses spécifie la touche du clavier en question.
    end

    if love.keyboard.isDown("a") and pad.y > 0 then --Ici on souhaite que lorsque la touche haut est enfoncé notre raquette remonte sur l'axe des y polur se rapprocher de sa position initiale proche de 0.
        pad.y = pad.y - 3
    end

    --Raquette J2
    if love.keyboard.isDown("down") and pad2.y < love.graphics.getHeight() - pad2.hauteur then
        pad2.y = pad2.y + 3
    end

    if love.keyboard.isDown("up") then
        pad2.y = pad2.y - 3
    end

    ball.x = ball.x + ball.vitesse_x
    ball.y = ball.y + ball.vitesse_y
--Sur l'update on veut que la position de la balle soit mise à jour en boucle.

    if ball.x < 0 then
        ball.vitesse_x = ball.vitesse_x * -1
    end
    if ball.y < 0 then
        ball.vitesse_y = ball.vitesse_y * -1
    end
    if ball.y > love.graphics.getHeight() - ball.hauteur then
        ball.vitesse_y = ball.vitesse_y * -1
    end

    --la balle a-t-elle atteint la raquette du J1 ?
    if ball.x <= pad.x + pad.largeur then
        -- Tester maintenant si la balle est sur la raquette ou pas
        if ball.y + ball.hauteur > pad.y and ball.y < pad.y + pad.hauteur then
          ball.vitesse_x = ball.vitesse_x * -1
        end
    end

    -- La balle a-t-elle atteint le bord gauche de l'écran
    if ball.x <= 0 then
        -- Perdu jouer 1!
        CentreBalle()
        score_joueur2 = score_joueur2 + 1
    end

    -- La balle a-t-elle atteint la raquette de droite ?
    if ball.x + ball.largeur >= pad2.x then
        -- Tester maintenant si la balle est sur la raquette ou pas
        if ball.y + ball.hauteur > pad2.y and ball.y < pad2.y + pad2.hauteur then
            ball.vitesse_x = ball.vitesse_x * -1
        end
    end

    -- La balle a-t-elle atteint le bord droit de l'écran
    if ball.x + ball.largeur > love.graphics.getWidth() then
        -- Perdu joueur 2 !
        CentreBalle()
        score_joueur1 = score_joueur1 + 1
    end
end

function love.draw() --love.draw dessine le jeu

        --Raquette J1
    love.graphics.rectangle("fill", pad.x, pad.y, pad.largeur, pad.hauteur)
--Cette propriété nous permet de dessiner un rectangle rempli grace à "fill"
--Puis, respectivement x, y, largeur, hauteur
        --Raquette J2
    love.graphics.rectangle("fill", pad2.x, pad2.y, pad2.largeur, pad2.hauteur)

        --Balle
    love.graphics.rectangle("fill", ball.x, ball.y, ball.largeur, ball.hauteur)

    local score = score_joueur1.." - "..score_joueur2
    love.graphics.print(score, 400, 0)
end

--Ici, je demande à mon programme de dessiner le rectangle avec comme paramètre y donc la hauteur de l'écran (et pas de l'objet)
--la variable positiony qui change au fil du temps puisque mon programme réalise sa boucle entre la fonction update et draw.
--Cela nous donne un rectangle qui descend à l'infini lorsque le programme est executé.