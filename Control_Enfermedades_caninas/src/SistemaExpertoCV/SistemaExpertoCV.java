
package SistemaExpertoCV;
import java.awt.Color;
import java.awt.Font;
import java.awt.Image;
import java.awt.Toolkit;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ArrayList;
import javax.swing.BorderFactory;
import javax.swing.ButtonGroup;
import javax.swing.ImageIcon;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JPanel;

import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import javax.swing.UIManager;
import javax.swing.border.Border;

import jess.ConsolePanel;
import jess.JessException;//---
import jess.Rete;//''''
import jess.Rete.*;//''''
import org.jvnet.substance.SubstanceLookAndFeel;

/**
 * Sistemas Expertos con Encadenamiento hacia Adelante
 */

public class SistemaExpertoCV extends JFrame
{
    JLabel titulo = new JLabel();
    JLabel tira = new JLabel();
    JLabel nota= new JLabel();
    JLabel panel_imagen =new JLabel();
    JLabel pnlopcionResp = new JLabel();
    JLabel lblImage = new JLabel();
    JLabel lblFondo = new JLabel();
    JLabel plantilla=new JLabel();
    JLabel lblpregunta = new JLabel();
    JPanel pnlCabecera = new Transparente();
    JPanel pnlOpciones = new Transparente();
    JPanel botones = new Transparente();
    JTextArea memoria_trabajo = new JTextArea("MEMORIA DE TRABAJO");
    ImageIcon imagen_memoria = new ImageIcon(getClass().getResource("/imagenes/hojadecuaderno.png"));
    ImageIcon imagen_bebes = createImageIcon("/imagenes/perritos.jpg","tira");
    //ImageIcon imagen_fondo = createImageIcon("/imagenes/Captura.png","fondo");
    ImageIcon imagen_cabecera = createImageIcon("/imagenes/titulo_modificado.png","cabecera");
    ImageIcon imagen_nota = createImageIcon("/imagenes/hoja_nota.png","nota");
    JOptionPane panelOpciones;
    ButtonGroup grupo = new ButtonGroup();
    final int ancho = 800;
    final int alto = 700;

    Rete r;
    ConsolePanel consola;
    ArrayList <Object> lis= new ArrayList();
    int contador=0;
   
    public SistemaExpertoCV()
    {
        setDefaultCloseOperation(EXIT_ON_CLOSE);
        setBounds(200,20,ancho,alto);
        setLayout(null);
        setTitle("SISTEMA EXPERTO SELECCION DE ENFERMEDADES CANINAS");
        setResizable(false);
        
        lblFondo.setBounds(0, 0, ancho,alto);
        //lblFondo.setIcon(imagen_fondo);
        plantilla.setBounds(0,225,500,500);
        plantilla.setIcon(imagen_memoria);
        tira.setBounds(0,160,800,150);
        tira.setIcon(imagen_bebes);
        nota.setBounds(500,170,400,600);
        nota.setIcon(imagen_nota);
        JScrollPane areaScroll = new JScrollPane(memoria_trabajo);
        
        titulo.setBounds(0,-20,800,224);
        titulo.setHorizontalAlignment((int)CENTER_ALIGNMENT);
        panel_imagen.setBounds(3*ancho/4+5,4*alto/20,ancho/3,6*alto/20);
        areaScroll.setOpaque(false);
        areaScroll.setBounds(0,300,500,300);
        //botones.setBounds(0,18*alto/20,ancho,2*alto/20);
        botones.setBounds(10,590,475,70);
        botones.setOpaque(false);
        Border paddingBorder = BorderFactory.createEmptyBorder(10,10,10,10);
        Border border = BorderFactory.createEmptyBorder(10, 10, 10, 10);
        panelOpciones= new JOptionPane();
        titulo.setBorder(BorderFactory.createCompoundBorder(border,paddingBorder));
        titulo.setIcon(imagen_cabecera);
        panel_imagen.setBorder(BorderFactory.createCompoundBorder(border,paddingBorder));
        areaScroll.setVerticalScrollBarPolicy(JScrollPane.VERTICAL_SCROLLBAR_ALWAYS);
        areaScroll.setBorder(BorderFactory.createCompoundBorder(border,paddingBorder));
        memoria_trabajo.setFont(new Font("Serif", Font.BOLD, 16));
        memoria_trabajo.setForeground(new Color(100,100,100));
        lis=getconsole();
        consola=(ConsolePanel) lis.get(1);
        consola.setBounds(545,400,200,200);
        consola.setFont(new Font("Serif", Font.BOLD, 16));
        consola.setForeground(new Color(100,100,100));
        
       
     
        
        JButton salir = new JButton ("Salir");
        salir.addActionListener (new ActionListener () {
            public void actionPerformed (ActionEvent e) {
                System.out.println("salir...");
                System.exit(0);
            }
        });
        //final JButton iniciar = new JButton ("<html><b><font color=#646464>Comenzar</font></b></html>");
        final JButton iniciar = new JButton ("Comenzar");
        iniciar.addActionListener (new ActionListener () {
            public synchronized void actionPerformed (ActionEvent e) {
                System.out.println("iniciando...");
                contador++;
               //consola=getconsole(contador);
              if(contador >=0) {
                    //iniciar.setText("<html><b><font color=#646464>Reiniciar</font></b></html>");
                    //iniciar.setText("Reiniciar");
                try {
                    //lis=getconsole();
                    //consola=(ConsolePanel) lis.get(1); 
                    r= (Rete) lis.get(0);
                    r.reset();
                    r.run();
                    r.eval("(facts)");
                    r.clear();
                } catch(JessException j){
                    System.out.println(" " + j.getMessage());
                }
                
                } 
            }     
        });
        final JButton reiniciar = new JButton ("Reiniciar");
        reiniciar.addActionListener (new ActionListener () {
            public synchronized void actionPerformed (ActionEvent e) {
                System.out.println("Reiniciando...");
                try {
                    lis=getconsole();
                    //consola=(ConsolePanel) lis.get(1); 
                    r= (Rete) lis.get(0);
                    r.reset();
                    r.run();
                    r.eval("(facts)");
                    r.clear();
                } catch(JessException j){
                    System.out.println(" " + j.getMessage());
                }
                }         
        });
        
        //añadiendo elementos a sus respectivos componentes
        botones.add(iniciar);
        botones.add(reiniciar);
        botones.add(salir);
        add(consola);
        add(titulo);
        add(plantilla);
        add(tira);
        
        add(panel_imagen);
        add(areaScroll);
        add(botones);
        add(lblImage);
        add(pnlCabecera);
        add(pnlOpciones);
        add(lblFondo);
        add(plantilla);
        add(nota);
        setVisible(true);
    }
    public String preguntar(String pregunta, ArrayList opciones){
        int tamano = opciones.size();
        Object datos[] = new Object[tamano];
        int i = 0;
        for (Object opcion : opciones) {
            opcion="<html><b><font color=#646464 >" + opcion + "</font></b></html>";
            datos[i] = (Object)opcion;
            i++;
        }
        pregunta="<html><b><font color=#E5605E >" + pregunta + "</font></b></html>";
        Object res = panelOpciones.showInputDialog(null,pregunta,"Responda",
                  panelOpciones.INFORMATION_MESSAGE, 
                  null, datos, datos[0]);
        String respuesta = (String)res;
        return quitarHTML(respuesta);
    }
    public ArrayList <Object> getconsole()
    {
        ArrayList <Object> lista=new ArrayList <Object>();
        Rete r;
        ConsolePanel consolas = null;
        r=new Rete();
        try {
            r.batch("/base_conocimiento/conocimiento.clp");//carga base de conoocimientod
            r.store("VENTANA", this);
            consolas = new ConsolePanel(r);
            //consolas.setBounds(550,350,200,200);
            //consolas.setFont(new Font("Serif", Font.BOLD, 16));
            //consolas.setForeground(new Color(100,100,100));
            //add(consolas);
            r.eval("(rules)");
        } catch (JessException e) {
            System.out.println(" " + e.getMessage());
        }
        lista.add(r);
        lista.add(consolas);
     return lista;
    }

    public static String quitarHTML(String htmlString)
    {
        String noHTMLString = htmlString.replaceAll("\\<.*?\\>", "");
        return noHTMLString;
    }

   public void setSubtitulo(String contenido) {
        contenido = "<html><h1><b><font color=#FF0000>" +contenido + "</font></b></h1></html>";
        //subtitulo.setText(contenido);
    }

    public void setMemoriaTrabajo(String texto)
    {
        memoria_trabajo.append("\n" + texto);
    }

    public void setImagen(String dir)
    {
        ImageIcon setImg = createImageIcon("/imagenes/"+dir,"fondo");
        Image imabMedio = setImg.getImage();
	ImageIcon imagm = new ImageIcon(imabMedio.getScaledInstance((ancho/3)-40,(8*alto/18)-40, 1));
        
        lblImage.setIcon(imagm);
    }

    public void setImagenResp(String dir)
    {
        ImageIcon setImg = createImageIcon("/Tabla_Vacunas/"+dir,"fondo");
        Image imabMedio = setImg.getImage();
	ImageIcon imagm = new ImageIcon(imabMedio.getScaledInstance(imabMedio.getWidth(null),imabMedio.getHeight(null), 1));

        pnlopcionResp.setBounds(0, 0,imagm.getIconWidth(),imagm.getIconHeight());
        pnlopcionResp.setIcon(imagm);

        JFrame res= new JFrame();
        res.setBounds(0, 0,imagm.getIconWidth(),imagm.getIconHeight()+50);
        res.add(pnlopcionResp);
        res.setTitle("Conclusiones:");
        

        
        res.setVisible(true);
    }

    private ImageIcon createImageIcon(String path, String description)
    {
        java.net.URL imgURL = getClass().getResource(path);
        if (imgURL != null) {
            return new ImageIcon(imgURL, description);
        } else {
            System.err.println("Couldn't find file: " + path);
            return null;
        }
    }
    public static void main(String args[])
    {
        java.awt.EventQueue.invokeLater(new Runnable()
        {
            public void run()
            {
                try {
                    JFrame.setDefaultLookAndFeelDecorated(true);
                    SubstanceLookAndFeel.setSkin("org.jvnet.substance.skin.BusinessBlackSteelSkin");
                    UIManager.setLookAndFeel("com.substance.plaf.mcwin.McWinLookAndFeel");
                } catch (Exception e) {
                }
              
                //SistemaExpertoCV da = 
                        new SistemaExpertoCV();
                
            }
        });
    }

}
