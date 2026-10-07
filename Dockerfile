# Stage 1: Build Environment
FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
WORKDIR /src

COPY ["WSMS/WSMS.csproj", "WSMS/"]
COPY ["Bll/Bll.csproj", "Bll/"]
COPY ["DAL/DAL.csproj", "DAL/"]
COPY ["Entites/Entites.csproj", "Entites/"]

RUN dotnet restore "WSMS/WSMS.csproj"

COPY . .

WORKDIR "/src/WSMS"
RUN dotnet publish "WSMS.csproj" -c Release -o /app/publish /p:UseAppHost=false

# Stage 2: ASP.NET Runtime Environment
FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS final
WORKDIR /app

COPY --from=build /app/publish .

# Sabhi static aur nested wwwroot folders create karein
RUN mkdir -p /app/FileDerectory \
             /app/EmployeeImage \
             /app/SchoolDocs \
             /app/Assignment \
             /app/Uploads \
             /app/wwwroot/FileDerectory \
             /app/wwwroot/EmployeeImage \
             /app/wwwroot/SchoolDocs \
             /app/wwwroot/Assignment \
             /app/wwwroot/DataImportSample \
             /app/wwwroot/HomeworkFiles \
             /app/wwwroot/AdmissionFiles \
             /app/wwwroot/BranchLogo \
             /app/wwwroot/AssignmentFile/StudentUpload \
             /app/wwwroot/ErrorLogs

EXPOSE 8080

ENTRYPOINT ["dotnet", "WSMS.dll"]
