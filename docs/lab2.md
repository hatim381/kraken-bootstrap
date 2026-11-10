Le job `kraken / lint-test` lance `ruff check .` et `pytest` sur chaque pull request : un lint ou un test cassé fait échouer le check.
La règle `protect-main` interdit le push direct sur `main` et bloque le merge tant que `kraken / lint-test` et `kraken / build-push` ne sont pas verts.
Un `Dockerfile` cassé est attrapé par `kraken / build-push`, qui construit l'image sur chaque PR, et `needs: lint-test` empêche ce job de tourner si les tests échouent.
