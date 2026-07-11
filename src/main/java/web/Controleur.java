
   package web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.GestionEvenement;
import dao.GestionOrganisateur;
import dao.GestionParticipant;
import entities.Evenement;
import entities.Organisateur;
import entities.Participant;

@WebServlet(urlPatterns = {"/accueil","/eventManager", "/evenements", "/delete", "/modifier","/ajouter","/search","/organisateurs","/voirParticipant","/deleteOrganisateur","/ajoutOrg","/saveOrganisateur","/participants","/ajoutpart","/deletepart","/savepart"})

    public class Controleur extends HttpServlet {
	
    private GestionEvenement dao = new GestionEvenement();
    private GestionOrganisateur gestionOrg = new GestionOrganisateur();
    private GestionParticipant gestionPart = new GestionParticipant();
    private GestionParticipant gestionParticipant = new GestionParticipant();


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String path = request.getServletPath();
        
        if("/organisateurs".equals(path)) {
            List<Organisateur> organisateurs = gestionOrg.getAllOrganisateurs();
            request.setAttribute("listeOrganisateurs", organisateurs);
            request.getRequestDispatcher("/organisateurs.jsp").forward(request, response);

        } else if ("/eventManager".equals(path)) {
            request.getRequestDispatcher("/accueil.jsp").forward(request, response);

        } else if("/participants".equals(path)) {
            List<Participant> participants = gestionPart.getAllParticipants();
            request.setAttribute("listeParticipants", participants);
            request.getRequestDispatcher("/participants.jsp").forward(request, response);

        }
           else if("/voirParticipant".equals(path)) {

        	    String eventIdParam = request.getParameter("id"); 
        	    
        	    if (eventIdParam != null && !eventIdParam.isEmpty()) {
        	        int eventId = Integer.parseInt(eventIdParam);

        	        List<Participant> participants = gestionParticipant.getParticipantsByEventId(eventId);

        	        request.setAttribute("listeParticipants", participants);
        	        request.getRequestDispatcher("voirParticipant.jsp").forward(request, response);
        	    } 

           else {
               response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Event ID is missing or invalid.");
           }
       }
           else  if("/ajoutOrg".equals(path)) {
           request.getRequestDispatcher("/ajoutOrg.jsp").forward(request, response);}
           
           else  if("/ajoutpart".equals(path)) {
               request.getRequestDispatcher("/ajoutpart.jsp").forward(request, response);}
           
           else if ("/deleteOrganisateur".equals(path)) {
        	    String organisateurId = request.getParameter("id");
        	    
        	    if (organisateurId != null) {
        	        gestionOrg.deleteOrganisateur(Integer.parseInt(organisateurId));
        	    }
        	    
        	    response.sendRedirect(request.getContextPath() + "/organisateurs");
        	    return;
        	}
           else if ("/deletepart".equals(path)) {
       	    String participantId = request.getParameter("id");
       	    
       	    if (participantId != null) {
       	        gestionPart.deleteParticipant(Integer.parseInt(participantId));
       	    }
       	    
       	    response.sendRedirect(request.getContextPath() + "/participants");
       	    return;
       	}
           else if ("/evenements".equals(path)) {
            String motCle = request.getParameter("mc");  
            List<Evenement> evenements;

            if (motCle != null && !motCle.isEmpty()) {
                evenements = dao.getEventsBMY(motCle); 
            } else {
                evenements = dao.getAllEvenements();
            }

            request.setAttribute("listeEvenements", evenements);  
            request.setAttribute("mc", motCle);  
            request.getRequestDispatcher("/evenements.jsp").forward(request, response);
        }
    
        else if ("/delete".equals(path)) {
            String evenementId = request.getParameter("id");
            
            if (evenementId != null) {
                dao.deleteEvenement(Integer.parseInt(evenementId));
            }

            response.sendRedirect(request.getContextPath() + "/evenements"); 
        }
       
        else if ("/modifier".equals(path)) {
            String evenementId = request.getParameter("id");

            if (evenementId != null && !evenementId.isEmpty()) {
                Evenement evenement = dao.getEvenement(Integer.parseInt(evenementId));
                List<Organisateur> allOrganisateurs = dao.getAllOrganisateurs(); 
                
                if (evenement != null) {
                    request.setAttribute("evenement", evenement);
                    request.setAttribute("allOrganisateurs", allOrganisateurs);
                    request.getRequestDispatcher("/modifierEvent.jsp").forward(request, response);
                } else {
                    response.sendRedirect("evenements");
                }
            } else {
                response.sendRedirect("evenements");
            }
        
        }
        else if ("/ajouter".equals(path)) {
            List<Organisateur> allOrganisateurs = dao.getAllOrganisateurs();
            request.setAttribute("allOrganisateurs", allOrganisateurs); 
            request.getRequestDispatcher("/ajoutEvent.jsp").forward(request, response);
        }
      
          else {
            request.getRequestDispatcher("/accueil.jsp").forward(request, response);
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String path = request.getServletPath();

        if ("/ajouter".equals(path)) {
            String nom = request.getParameter("nom");
            String lieu = request.getParameter("lieu");
            int organisateurId = Integer.parseInt(request.getParameter("organisateur"));

            Organisateur org = dao.getOrganisateurById(organisateurId);
            
            Evenement evenement = new Evenement();
            evenement.setNom(nom);
            evenement.setLieu(lieu);
            evenement.setOrganisateur(org);

            dao.addEvenement(evenement);  

            response.sendRedirect(request.getContextPath() + "/evenements"); 
        }
        else if ("/saveOrganisateur".equals(path)) {

             String nom = request.getParameter("nom");
        
        Organisateur org = new Organisateur();
        org.setNom(nom);
        
        GestionOrganisateur dao = new GestionOrganisateur();
        dao.addOrganisateur(org);
        
        response.sendRedirect("organisateurs"); 
    }
        else if ("/savepart".equals(path)) {

            String nom = request.getParameter("nom");
            String prenom = request.getParameter("prenom");
            String email = request.getParameter("email");


       
       Participant part = new Participant();
       part.setNom(nom);
       part.setPrenom(prenom);
       part.setEmail(email);


       
       GestionParticipant dao = new GestionParticipant();
       dao.addParticipant(part);
       
       response.sendRedirect("participants"); 
   }

        else if ("/modifier".equals(path)) {
            int id = Integer.parseInt(request.getParameter("id")); 
            String nom = request.getParameter("nom");
            String lieu = request.getParameter("lieu");
            int organisateurId = Integer.parseInt(request.getParameter("organisateurId"));

            Evenement evenement = dao.getEvenement(id);
            evenement.setNom(nom);
            evenement.setLieu(lieu);

            Organisateur org = dao.getOrganisateurById(organisateurId);
            evenement.setOrganisateur(org);

            dao.updateEvenement(evenement);

            response.sendRedirect(request.getContextPath() + "/evenements");
        }
    }
    }

 