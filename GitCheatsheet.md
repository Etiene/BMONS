Apprendre a utiliser Github
===========================

# Cheatsheet

## Creer un espace de travail personnel
 
* Cliquer sur Fork sur la page d'origine du projet
 
 
## Creer un clone sur son ordi

Ca crée une copie du dossier BMONS 
Utilisez l'adresse donnée sur votre page du projet
* git clone https://github.com/<mettez ici votre nom>/BMONS.git
  
 
## Creer une branche et s'y déplacer
 
Création
* git branch <nom de la nouvelle branche>
 
Déplacement
* git checkout <nom de la branche>
Vous avez une branche master à la base et vous pouvez créer autant de branches que vous voulez chez vous
 
## Enregistrer des modifications d'un fichier
 
* git add monfichier

## Faire une sauvegarde des modifications
 
Un commit correspond à "faire un point sur la branche", vous pouvez le faire sur toutes les branches
* git commit -m "message de commit"
 
Modifier le message d'un comit
* git commit --amend -m "Nouveau message"
 

## Annuler un commit
 
Revient au dernier commit
* git reset HEAD 

Revient avant le dernier commit
* git reset HEAD^
 
On peut aussi donner le numero précis d'un commit (les premiers chiffres peuvent suffirent)
* git reset d6d98923868578a7f38dea79833b56d0326fcba1 

* git reset d6d9892
 
 
 
## Fermer une branche

Fusionne une branche avec la branche master
* git merge <nom de la branche>
 
Il peut y avoir des conflits si plusieurs modifications d'un même fichier ne sont pas compatibles dans ce cas utilisez un outils comme mergetool
 
Congiguration
* git config --global merge.tool meld
 
  git config --global mergetool.meld.path c:/... 

Utilisation
* git merge <nom de la branche>
* git mergetool meld

## Savoir où on en est

Permet de voir les commits qui ont été faits
* git log

Permet de voir si des fichiers ne sont pas enregistrer et les modifications
* git status

## Envoyer les modifs à votre espace en ligne

* git push https://github.com/<mettez ici votre nom>/BMONS.git master 

## Envoyer les modifs au projet d'origine

* git request-pull https://github.com/<mettez ici votre nom>/BMONS.git master