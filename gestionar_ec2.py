import boto3

ec2 = boto3.resource('ec2', region_name='us-east-1')
s3 = boto3.client('s3')

def listar_recursos():
    print("--- Listando Buckets S3 ---")
    buckets = s3.list_buckets()
    for bucket in buckets['Buckets']:
        print(f"Bucket: {bucket['Name']}")

def crear_instancia():
    print("\n--- Creando Instancia de Prueba (t2.micro) ---")
    # Usamos el LabRole porque Learner Lab no deja crear roles
    instancia = ec2.create_instances(
        ImageId='ami-0c101f26f147fa7fd', # Amazon Linux 2023
        MinCount=1,
        MaxCount=1,
        InstanceType='t2.micro',
        KeyName='vockey' # Key por defecto en Learner Lab
    )
    print(f"Instancia creada con ID: {instancia[0].id}")

if __name__ == "__main__":
    listar_recursos()
    # crear_instancia() # Descomenta para ejecutar la creación
