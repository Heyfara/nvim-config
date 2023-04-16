## Ma config NeoVim

Prérequis :
 - Installer (ripgrep)[https://github.com/BurntSushi/ripgrep]
 - Npm pour certains LSP

Config entièrement en lua. Les plugins sont gérés avec Packer car un bug 
(non identifié) avec Lazy empêche l'indentation des fichiers twig de 
fonctionner correctement :/

Les plugins sont configurés avec des fichiers dédiés dans after/plugin. Cela 
permet de gader la config claire.

* packer.lua : ajout des plugins
* remaps.lua : mappings custom
* settings.lua : modifications de certaines options de nvim
