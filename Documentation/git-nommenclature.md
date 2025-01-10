# Nommenclature Git

## Nomenclature branche

| Type branche          | Nommage       | Sous branche      |Objectif
|:----------------------|:--------------|:------------------|:----------------------------------------------|
| Branche principale    | main          |  Non                              | Version stable et déployé en production       |
| Developpement         | develop       |  Non                              | Integre toutes les modifciation en cours      |
| Init                  | init          |  Non                              | Integre les fichiers d'initialisation         |
| Fonctionnalités       | feature       |  feature/<nom fonctionnalité>     | Développement de nouvelles fonctionnalités    |
| Correction de bug     | bugfix        |  bugfix/<identification bug>      | Correction de bugs dans develop               |
| Configuration         | config        |  config/<identification config>    | Modifications de configuration               |
| Documentations        | docu          |  docu/<identificaition doc>       | Modifications de la documentation             |

## Nomenclature des commit

Format : **domaine(scope) - action : message**

exemple : doc(Mise sur Github) add 'Ajouter du fichier de nomenclature des commit github'
ou           fix (dem245) fix 'Normalisation des boutons de Inscription/Location'

## Domaine

Le domaine reprend les thématiques :

| En lien avec la branche | Nommage         | Objectif                                                 |

|-------------------------|-----------------|----------------------------------------------------------|

| **Initialisation**      | `init`         | Initialisation du projet                                 |

| **Correctif urgent**    | `hotfix`        | Appliquer des correctifs critiques en production         |

| **Pré-production**      | `release`       | Stabiliser la version avant mise en production           |

| **Fonctionnalité**      | `feature`       | Ajouter, modifier, supprimer des fonctionnalités         |

| **Configuration**       | `config`        | Ajouter, modifier, supprimer une configuration           |

| **Correction de bug**   | `fixbug`        | Corriger des bugs                                        |

| **Refactorisation**     | `refacto`       | Améliorer le code sans changer la fonctionnalité         |

| **Tests**               | `test`          | Développer et tester des suites de tests                 |

| **Documentation**       | `doc`           | Ajouter ou modifier la documentation                     |

| **Expérimentation**     | `essais`        | Tester des idées ou solutions temporaires                |

## Scope

`scope` : Le scope décrit l'environnement du projet directement impacté

## Actions

| Type de commit       | Nommage | Objectif                                            |

|----------------------|---------|------------------------------------------------------|

| Ajouter              | `-add`  | Ajoute une fonctionnalité, un élément, un environnement, etc. |

| Modifier             | `-upd`  | Modifie une fonctionnalité, un élément, un environnement, etc. |

| Supprimer            | `-del`  | Supprime une fonctionnalité, un élément, un environnement, etc. |

| Corriger             | `-fix`  | Corrige une fonctionnalité, un élément, un environnement, etc. |

## Message

Le message doit être **descriptif** (non générique) et expliquer concrètement la raison de l'action menée dans ce commit.
