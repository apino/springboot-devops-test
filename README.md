# CI/CD PIPELINE — SPRING BOOT DEVOPS TEST

```text
        ┌─────────────────────────────────┐
        | Trigger: Push a rama main       |
        └─────────────────────────────────┘
                │
                ▼
        ┌─────────────────────────────────┐
        │   BUILD STAGE                   │
        ├─────────────────────────────────┤
        │ - Checkout código               │
        │ - Usa imagen                    │
        │   apinoo/mvn-runner-test:latest |
        │ - mvn clean package -DskipTests |
        │ - Publica .jar como artefacto   |
        └─────────────────────────────────┘
                │
                ▼
        ┌─────────────────────────────────┐
        │   SAST STAGE                    │
        ├─────────────────────────────────┤
        │ - Análisis estático simulado    │
        │   (Checkstyle / SonarQube)      │
        └─────────────────────────────────┘
                │
                ▼
        ┌─────────────────────────────────┐
        │  RELEASE STAGE                  │
        ├─────────────────────────────────┤
        │ - Descarga artefacto .jar       │
        │ - Valida integridad             │
        │ - Publica en Azure Artifacts    │
        └─────────────────────────────────┘
                │
                ▼
        ┌─────────────────────────────────┐
        │      DEPLOY STAGE (Simulado)    │
        ├─────────────────────────────────┤
        │ 1. mkdir -p /opt/app/releases.  │
        │ 2. mv springboot-devops.jar     │
        │    springboot-devops_<fecha>.jar|
        │ 3. Copia nuevo .jar (echo)      │
        │ 4. java -jar app.jar &          │
        │ 5. Limpieza y validación        │
        └─────────────────────────────────┘
                │
                ▼
        ┌─────────────────────────────────┐
        | PIPELINE COMPLETADO             |
        └─────────────────────────────────┘
```
