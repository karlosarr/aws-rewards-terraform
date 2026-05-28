# AWS Rewards Infrastructure 💰

Este proyecto despliega la infraestructura necesaria para cumplir con los retos de AWS y obtener los 100 USD en créditos.

## 🚀 Tareas Cubiertas

| Actividad | Recurso Terraform | Estado |
| :--- | :--- | :--- |
| Lanzamiento de EC2 | `aws_instance.rewards_ec2` | ✅ Automatizado |
| Configuración de Budgets | `aws_budgets_budget.cost_budget` | ✅ Automatizado |
| App Web con Lambda | `aws_lambda_function.web_app` + API Gateway | ✅ Automatizado |
| Base de datos RDS | `aws_db_instance.rewards_db` | ✅ Automatizado |
| Amazon Bedrock | Manual (Consola AWS) | ⚠️ Acción requerida |

## 🛠️ Guía de Instalación y Despliegue

### 1. Requisitos
- [Terraform](https://developer.hashicorp.com/terraform/downloads) instalado.
- AWS CLI configurado con credenciales válidas (`aws configure`).
- Una llave SSH llamada `key-ssh` creada previamente en la consola de AWS (Región us-east-1).

### 2. Configuración Personalizada
Antes de desplegar, edita el archivo `terraform.tfvars`:
- **email**: Tu correo electrónico real para recibir las alertas de presupuesto.
- **db_password**: Una contraseña segura para RDS.

### 3. Acceso SSH y Llaves
Para conectarte a la instancia EC2, utiliza el archivo `.pem` de la llave `key-ssh`:
```bash
chmod 400 key-ssh.pem
ssh -i key-ssh.pem ec2-user@<ec2_public_ip>
```

### 4. Ejecución y CI/CD
El proyecto incluye pipelines de GitHub Actions para automatizar la validación y el despliegue.

**Localmente:**
```bash
terraform init
terraform validate
terraform apply -auto-approve
```

**Via GitHub Actions:**
- **CI**: Se ejecuta automáticamente en cada Pull Request para validar la sintaxis.
- **Deploy**: Se ejecuta al hacer push a `main` o manualmente.
- **Destroy**: Se ejecuta manualmente para limpiar los recursos.

### 3. Ejecución
```bash
# Entrar al directorio
cd terraform/aws-rewards

# Inicializar Terraform
terraform init

# Desplegar la infraestructura
terraform apply -auto-approve
```

### 4. Activación de Bedrock (Manual)
Amazon Bedrock requiere la aceptación de términos legales que no pueden automatizarse:
1. Ve a la Consola de AWS $\rightarrow$ **Amazon Bedrock**.
2. En el menú lateral, haz clic en **Model Access**.
3. Haz clic en **Edit**, selecciona un modelo (ej. *Amazon Titan Text G4*) y guarda los cambios.
4. Una vez activado, ve al **Playground** $\rightarrow$ **Text** y envía cualquier mensaje.

## ⚠️ Limpieza (MUY IMPORTANTE)
Para evitar cargos inesperados una vez que AWS haya validado tus créditos, elimina todos los recursos:

```bash
terraform destroy -auto-approve
```

## 📊 Salidas (Outputs)
Al finalizar `terraform apply`, obtendrás:
- `ec2_public_ip`: IP pública de la instancia EC2.
- `api_url`: URL de tu aplicación Lambda (visítala para validar la tarea).
- `rds_endpoint`: Endpoint de la base de datos.
