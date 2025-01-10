# Install en use mkdocs

[Doc oficielle](https://www.mkdocs.org/)

## Etape 1.Faire un depot github

- definir les regles de protection de la branche main.
- definir supression automatique des branche apres PR.

## Etape 2. Deployer en local dans avec un dev container

- créer un .devcontainer et un dockerfile pour initialiser l'image docker de mkdocs
- créer un dossier docs à la racine du projet pour stocker les fichier de la documentation
- créer un fichier mkdocs.yml pour configurer mkdocs
- créer un fichier requirements.txt pour lister les dependances

[acceder au site en local](http://127.0.0.1:8000/)

## 3. workflow : deployer le contenu sur le serveur

### deployement sur serveur

- créer un local runner sur le serveur
- configurer dans .github/workflows le workflow pour deployer le contenu sur le serveur

[acceder au site sur le serveur](http://itdeveloppement-server.eddi.cloud/doctest/index.html)
remplacer itdeveloppement-server.eddi.cloud par id du serveur

### deployement sur github page

- configurer dans .github/workflows le workflow pour deployer le contenu sur une page github page
- activer la github page sur github / depot / seeting / pages / active github action
  
[acceder à la page github page](https://oclock-deployement.github.io/mkdocs/)

