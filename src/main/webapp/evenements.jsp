<%@ page pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="navbar.html" %>

<div class="container mt-4">
    <div class="d-flex justify-content-between align-items-center mb-4 py-3 border-bottom border-primary-subtle">
        <h1 class="display-5 fw-bold text-primary-gradient mb-0">Événements</h1>
    </div>

    <div class="card search-card border-0 shadow-sm mb-4">
        <div class="card-body p-3 p-lg-4">
<form action="evenements" method="get" role="search">
                <div class="input-group">
                    <span class="input-group-text bg-transparent border-0 pe-1 py-2 py-lg-3">
                        <i class="fas fa-search text-primary fs-5"></i>
                    </span>
                    
                    <input type="text" 
                           name="mc" 
                           class="form-control form-control-lg border-0 shadow-none ps-2"
                           value="${mc}"
                           placeholder="Rechercher un événement..."
                           aria-label="Rechercher un événement"
                           aria-describedby="search-button">
                    
                    <button type="submit" 
                            class="btn btn-link text-decoration-none text-primary px-3 px-lg-4 hover-scale"
                            id="search-button">
                        <span class="d-none d-lg-inline fs-5 me-2">Search</span>
                        <i class="fas fa-arrow-right-long fs-5"></i>
                    </button>
                </div>
            </form>
        </div>
    </div>

    <c:if test="${empty listeEvenements}">
    <div class="alert alert-warning mt-4">Aucun événement trouvé pour "${mc}".</div>
</c:if>

<c:if test="${not empty listeEvenements}">
    <div class="card border-0 shadow-sm mt-4">
        <div class="card-body p-0">
            <div class="table-responsive">
                <table class="table table-hover align-middle mb-0">
                    <thead class="table-primary">
                        <tr>
                            <th class="py-3 ps-4 w-25">Nom</th>
                            <th class="py-3">Lieu</th>
                            <th class="py-3">Organisateur</th>
                            <th class="py-3 pe-4 text-end">Actions</th>
                        </tr>
                    </thead>
                   
                    <tbody>
                        <c:forEach var="e" items="${listeEvenements}">
                            <tr class="cursor-pointer hover-lift">
                                <td class="ps-4 fw-medium text-primary">${e.nom}</td>
                                <td>
                                    <i class="fas fa-map-marker-alt text-primary me-2"></i>${e.lieu}
                                </td>
                                <td>
                                    <c:choose>
                                        <c:when test="${not empty e.organisateur}">
                                            <span class="badge bg-primary-subtle text-primary px-3 py-2">
                                                <i class="fas fa-user-tie me-2"></i>${e.organisateur.nom}
                                            </span>
                                        </c:when>
                                        <c:otherwise>
                                            <span class="text-muted fst-italic">Non spécifié</span>
                                        </c:otherwise>
                                    </c:choose>
                                </td>
                                <td class="pe-4 text-end">
                                    <div class="d-flex gap-2 justify-content-end">
                                        <a href="modifier?id=${e.id}" 
                                           class="btn btn-sm btn-outline-primary px-3 py-2 hover-scale">
                                            <i class="fas fa-edit me-2"></i>Update
                                        </a>
                                        <a href="delete?id=${e.id}" 
                                           class="btn btn-sm btn-outline-danger px-3 py-2 hover-scale"
                                           onclick="return confirm('Êtes-vous sûr de vouloir supprimer cet événement ?')">
                                            <i class="fas fa-trash-alt me-2"></i>Delete
                                        </a>
                                    <a href="voirParticipant?id=${e.id}" 
   class="btn btn-sm px-3 py-2 text-white border-0"
   style="background: linear-gradient(135deg, #00c9ff, #92fe9d);
          transition: transform 0.2s ease, box-shadow 0.3s ease;
          border-radius: 0.5rem;
          font-weight: 500;
          box-shadow: 0 4px 6px rgba(0,0,0,0.1);"
   onmouseover="this.style.transform='translateY(-2px) scale(1.05)'; 
                this.style.boxShadow='0 6px 12px rgba(0,0,0,0.2)';"
   onmouseout="this.style.transform='none'; 
               this.style.boxShadow='0 4px 6px rgba(0,0,0,0.1)';">
    <i class="fas fa-users me-2"></i>Participants
</a>


        
                                    </div>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</c:if>
    
</div>

<style>
    :root {
        --bleu-fond: #f8fbff;
        --bleu-clair: #e3f2ff;
        --bleu-moyen: #cfe2ff;
        --bleu-fonce: #0d6efd;
    }

    body {
        background-color: var(--bleu-fond);
        font-family: 'Segoe UI', system-ui, -apple-system, sans-serif;
    }

    .text-primary-gradient {
        background: linear-gradient(45deg, var(--bleu-fonce), #2d8cff);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
    }

    .search-card {
        background: var(--bleu-clair);
        border: 1px solid rgba(13, 110, 253, 0.1);
        border-radius: 0.75rem;
        transition: transform 0.2s ease;
    }

    .table-hover tr:hover {
        background-color: var(--bleu-moyen) !important;
    }

    .badge {
        background-color: rgba(13, 110, 253, 0.15) !important;
        color: var(--bleu-fonce) !important;
        border: 1px solid rgba(13, 110, 253, 0.25);
        border-radius: 0.5rem;
        transition: opacity 0.2s ease;
    }

    .btn-outline-primary {
    border-color: var(--bleu-fonce);
    color: var(--bleu-fonce);
    position: relative;
    overflow: hidden;
    transition: all 0.3s ease;
}

.btn-outline-primary:hover {
    background-color: var(--bleu-fonce);
    color: white !important;
    box-shadow: 0 4px 12px rgba(13, 110, 253, 0.2);
}

.btn-outline-primary:hover i {
    color: white !important;
    animation: iconBounce 0.4s ease;
}

@keyframes iconBounce {
    0%, 100% { transform: translateY(0); }
    50% { transform: translateY(-3px); }
}


    .hover-scale {
        transition: transform 0.2s ease;
    }

    .hover-scale:hover {
        transform: translateY(-2px) scale(1.02);
    }

    .cursor-pointer { 
        cursor: pointer; 
        transition: background-color 0.2s ease; 
    }

    .cursor-pointer:hover {
        background-color: rgba(13, 110, 253, 0.05);
    }
</style>