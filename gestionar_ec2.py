import boto3

ec2 = boto3.client('ec2', region_name='us-east-1')
s3 = boto3.client('s3')

def ejecutar_reporte():
    print("--- 1. Verificando Almacenamiento (S3) ---")
    buckets = s3.list_buckets()
    for b in buckets['Buckets']:
        print(f"Bucket: {b['Name']}")

    print("\n--- 2. Estado de Servidores (EC2) ---")
    instancias = ec2.describe_instances()
    for r in instancias['Reservations']:
        for i in r['Instances']:
            print(f"ID: {i['InstanceId']} - Estado: {i['State']['Name']}")

if __name__ == "__main__":
    ejecutar_reporte()
