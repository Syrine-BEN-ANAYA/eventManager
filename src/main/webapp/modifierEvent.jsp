<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="navbar.html" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Modifier Événement</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            font-family: 'Segoe UI', system-ui, -apple-system, sans-serif;
        }
        .container-main {
            margin-top: 80px;
            padding: 30px;
        }
        .form-card {
            background: white;
            border-radius: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.05);
            padding: 30px;
        }
        .form-control {
            border-radius: 8px;
            padding: 12px;
            border: 1px solid #e0e0e0;
        }
        .form-label {
            font-weight: 500;
            margin-bottom: 6px;
        }
        .btn-primary {
            background-color: #6c5b7b;
            border-color: #6c5b7b;
        }
    </style>
</head>
<body>

<%@ include file="navbar.html" %>

<div class="container container-main">
    <div class="row justify-content-center">
        <div class="col-lg-8">
            <div class="form-card">
                <h3 class="mb-4 text-center">Modifier l'Événement</h3>
                <form action="modifier" method="post">
                    <input type="hidden" name="id" value="${evenement.id}" />

                    <div class="mb-3">
                        <label class="form-label">Nom de l'événement</label>
                        <input type="text" name="nom" class="form-control" value="${evenement.nom}" required />
                    </div>

                    <div class="mb-3">
                        <label class="form-label">Lieu</label>
                        <input type="text" name="lieu" class="form-control" value="${evenement.lieu}" required />
                    </div>

                   <label for="organisateur" class="form-label">Organisateur</label>
<select class="form-select" name="organisateurId" id="organisateur" required>
    <option value="">Sélectionnez un organisateur</option>

    <option value="1" ${evenement.organisateur.id == 1 ? 'selected' : ''}>Boudinar - evenements sociaux</option>
    <option value="2" ${evenement.organisateur.id == 2 ? 'selected' : ''}>eventPro - evenements professionnels</option>
    <option value="3" ${evenement.organisateur.id == 3 ? 'selected' : ''}>ExpertEvent - evenements culturels</option>

    <c:forEach items="${allOrganisateurs}" var="org">
        <option value="${org.id}" 
            ${evenement.organisateur.id eq org.id ? 'selected' : ''}>
            ${org.nom}
        </option>
    </c:forEach>
</select>
                    <div class="text-center mt-4">
                        <button type="submit" class="btn btn-primary px-4">Enregistrer</button>
                        <a href="Controleur?path=/evenements" class="btn btn-secondary ms-2">Annuler</a>
</a>
                        
                        
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
