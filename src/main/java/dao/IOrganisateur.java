package dao;

import entities.Organisateur;
import java.util.List;

public interface IOrganisateur {
    void addOrganisateur(Organisateur o);
    
    void deleteOrganisateur(int id);
    
    Organisateur getOrganisateur(int id);
    
    List<Organisateur> getAllOrganisateurs();
}
