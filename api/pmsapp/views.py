from django.shortcuts import render
from rest_framework import permissions
from rest_framework import status
from rest_framework.response import Response
from rest_framework.generics import (
    CreateAPIView,
    ListCreateAPIView, RetrieveUpdateDestroyAPIView)

from . models import Patient, Medicine, DrugPrescribed, Prescription
from . serializers import (PatientSerializer, DrugPrescribedSerializer,
                           MedicineSerializer, PrescriptionSerializer)
# Create your views here.

class PatientView(ListCreateAPIView):
    permission_classes = [permissions.IsAuthenticated]
    queryset = Patient.objects.all()
    serializer_class = PatientSerializer

class PatientUpdateView(RetrieveUpdateDestroyAPIView):
    permission_classes = [permissions.IsAuthenticated]
    queryset = Patient.objects.all()
    serializer_class = PatientSerializer

class MedicineView(ListCreateAPIView):
    permission_classes = [permissions.IsAuthenticated]
    queryset = Medicine.objects.all()
    serializer_class = MedicineSerializer

class MedicineUpdateView(RetrieveUpdateDestroyAPIView):
    permission_classes = [permissions.IsAuthenticated]
    queryset = Medicine.objects.all()
    serializer_class = MedicineSerializer

class DrugPrescribeView(CreateAPIView):
    permission_classes = [permissions.IsAuthenticated]
    queryset = Medicine.objects.all()
    serializer_class = DrugPrescribedSerializer

    def create(self, request):
        data = request.data
        print(f"data:{data}")
        prescription_data = data.pop('prescription')

        print(f"pres data:{prescription_data}")
        serializer = DrugPrescribedSerializer(data=data, many=True)
        prescribe = Prescription.objects.create(
            
        )

        # prescription_serializer = PrescriptionSerializer(data=prescription_data)
        # if prescription_serializer.is_valid():
        #     prescription = prescription_serializer.save()

        #     drug_prescribed_data = data.get('drug_prescribed', [])
        #     drug_prescribed_instances = []

        #     for item in drug_prescribed_data:
        #         item['prescription'] = prescription.pk
        #         drug_prescribed_serializer = DrugPrescribedSerializer(data=item)
        #         if drug_prescribed_serializer.is_valid():
        #             drug_prescribed = drug_prescribed_serializer.save()
        #             drug_prescribed_instances.append(drug_prescribed)

        #     return Response({'prescription':prescription_serializer.data, 'drug_prescribed':drug_prescribed_instances}, status=status.HTTP_201_CREATED)
        # return Response(prescription_serializer.errors, status=status.HTTP_400_BAD_REQUEST)


        


    # def post(self, request):
    #     data = request.data
    #     serializer = DrugPrescribedSerializer(data = data, many=True)
    #     if serializer.is_valid():
    #         for d in data:
    #             drugpres = DrugPrescribed.objects.create(
    #                 drug = Medicine.objects.get(medicine_id = d['drug']),
    #                 qty = d['qty'],
    #                 dosage = d['dosage'],
    #                 total = d['total'],
    #             )


class PrescriptionView(ListCreateAPIView):
    permission_classes = [permissions.IsAuthenticated]
    queryset = Prescription.objects.all()
    serializer_class = PrescriptionSerializer

    def post(self, request):
        data = request.data
        # drug_prescribed_data = data.pop('drug_prescribed')
        drug_prescribed_data = data.pop('drug_prescribed', [])

        # prescription
        prescription_serializer = PrescriptionSerializer(data=data)
        if prescription_serializer.is_valid():
            prescription_instance = prescription_serializer.save(total=0)

            total = 0

            for dp_data in drug_prescribed_data:
                dp_data['prescription'] = prescription_instance.pk
                dp_serializer = DrugPrescribedSerializer(data=dp_data)
                if dp_serializer.is_valid():
                    dp_instance = dp_serializer.save()
                    total += dp_instance.total
                else:
                    return Response(dp_serializer.errors, status=status.HTTP_400_BAD_REQUEST)


            return Response(prescription_serializer.data, status=status.HTTP_201_CREATED)
        else:
            return Response(prescription_serializer.errors, status=status.HTTP_400_BAD_REQUEST)
       

class PrescriptionModifyView(RetrieveUpdateDestroyAPIView):
    permission_classes = [permissions.IsAuthenticated]
    queryset = Prescription.objects.all()
    serializer_class = PrescriptionSerializer

    
