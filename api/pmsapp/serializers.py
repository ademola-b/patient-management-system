import base64
from django.core.files.storage import default_storage

from rest_framework import serializers

from . models import Patient, Medicine, Prescription

class PatientSerializer(serializers.ModelSerializer):
    imgMem = serializers.SerializerMethodField('image_memory')

    class Meta:
        model = Patient
        fields = [
            "patient_id",
            "name",
            "dob",
            "phone",
            "gender",
            "picture",
            "imgMem"
        ]
    def image_memory(request, image:Patient):
        if image.picture.name is not None:
            with default_storage.open(image.picture.name, 'rb') as loadedfile:
                return base64.b64encode(loadedfile.read())
            
class MedicineSerializer(serializers.ModelSerializer):

    class Meta:
        model = Medicine
        fields = "__all__"

class PrescriptionSerializer(serializers.ModelSerializer):

    class Meta:
        model = Prescription
        fields = "__all__"