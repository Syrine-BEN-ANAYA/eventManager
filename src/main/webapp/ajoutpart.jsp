<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="navbar.html"%>
<!DOCTYPE html>
<html>
<head>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: #f8f9fa;
        }
        .form-card {
            border: none;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.08);
            overflow: hidden;
            transition: transform 0.3s ease;
        }
        .form-card:hover {
            transform: translateY(-5px);
        }
        .card-header {
            background: linear-gradient(135deg, #6366f1 0%, #8b5cf6 100%);
            color: white;
            padding: 1.5rem;
            border-bottom: none;
        }
        .form-label {
            font-weight: 500;
            color: #374151;
            margin-bottom: 0.5rem;
        }
        .form-control {
            border: 2px solid #e5e7eb;
            border-radius: 8px;
            padding: 0.75rem 1.25rem;
            transition: all 0.3s ease;
        }
        .form-control:focus {
            border-color: #818cf8;
            box-shadow: 0 0 0 3px rgba(129, 140, 248, 0.2);
        }
        .input-icon {
            position: absolute;
            left: 15px;
            top: 50%;
            transform: translateY(-50%);
            color: #9ca3af;
        }
        .btn-cancel {
            border: 2px solid #e5e7eb;
            color: #6b7280;
            font-weight: 500;
            padding: 0.6rem 1.5rem;
        }
        .btn-cancel:hover {
            background: #f3f4f6;
            color: #374151;
        }
        .btn-submit {
            background: linear-gradient(135deg, #6366f1 0%, #8b5cf6 100%);
            border: none;
            padding: 0.6rem 2rem;
            font-weight: 500;
            transition: transform 0.2s ease;
        }
        .btn-submit:hover {
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(99, 102, 241, 0.3);
        }
    </style>
</head>
<body>
<div class="container py-5">
    <div class="form-card mx-auto" style="max-width: 500px;">
        <div class="card-header">
            <h3 class="mb-0"><i class="fas fa-user-plus me-2"></i>Nouveau Participant</h3>
        </div>
        <div class="card-body p-4">
            <form action="savepart" method="POST">
                <div class="mb-4 position-relative">
                    <label class="form-label">Nom</label>
                    <div class="position-relative">
                        <i class="fas fa-user input-icon"></i>
                        <input type="text" 
                               name="nom" 
                               class="form-control ps-4"
                               placeholder="Entrez le nom"
                               required>
                    </div>
                </div>
                
                <div class="mb-4 position-relative">
                    <label class="form-label">Prénom</label>
                    <div class="position-relative">
                        <i class="fas fa-user-tag input-icon"></i>
                        <input type="text" 
                               name="prenom" 
                               class="form-control ps-4"
                               placeholder="Entrez le prénom"
                               required>
                    </div>
                </div>
                 <div class="mb-4 position-relative">
                    <label class="form-label">Email</label>
                    <div class="position-relative">
                        <i class="fas fa-user-tag input-icon"></i>
                        <input type="text" 
                               name="email" 
                               class="form-control ps-4"
                               placeholder="Entrez l'email"
                               required>
                    </div>
                </div>

                <div class="d-flex justify-content-end gap-3 mt-4">
                    <a href="organisateurs" class="btn btn-cancel">
                        Annuler
                    </a>
                    <button type="submit" class="btn btn-submit text-white">
                        <i class="fas fa-save me-2"></i>Enregistrer
                    </button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>