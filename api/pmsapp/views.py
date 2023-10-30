from django.shortcuts import render
from rest_framework import permissions
from rest_framework.generics import ListCreateAPIView, RetrieveUpdateDestroyAPIView

from . models import Patient, Medicine, Prescription
from . serializers import PatientSerializer, MedicineSerializer, PrescriptionSerializer
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

class PrescriptionView(ListCreateAPIView):
    permission_classes = [permissions.IsAuthenticated]
    queryset = Prescription.objects.all()
    serializer_class = PrescriptionSerializer

class PrescriptionModifyView(RetrieveUpdateDestroyAPIView):
    permission_classes = [permissions.IsAuthenticated]
    queryset = Prescription.objects.all()
    serializer_class = PrescriptionSerializer

    
