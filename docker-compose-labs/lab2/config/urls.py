from django.contrib import admin
from django.db import connection
from django.http import JsonResponse
from django.urls import path


def health(request):
    with connection.cursor() as cur:
        cur.execute("SELECT version()")
        version = cur.fetchone()[0]
    return JsonResponse({"status": "ok", "db": version})


urlpatterns = [
    path("admin/", admin.site.urls),
    path("health/", health),
]
