package SistemaExpertoCV;

import java.awt.Color;
import java.awt.Dimension;
import java.awt.Graphics;
import javax.swing.JPanel;
import javax.swing.border.CompoundBorder;
import javax.swing.border.EmptyBorder;
import javax.swing.border.EtchedBorder;


public class Transparente extends JPanel	
{
	
	/**
	 * Grado de transparencia en el rango [0.0 , 1.0]
	 */
	private float grado;
	
	/**
	 * Color de fondo usado en toda instancia de esta clase
	 */
	public static final Color backgroundColor = new Color(56, 142, 215); 
  
	public Transparente()	
	{
		this(.5f);
	}
	public Transparente(float grado)  {
		super();
		setOpaque(false);
		setGrado(grado);
		validate();
		
		setBackground(backgroundColor);
		setBorder(new CompoundBorder( 
			new EtchedBorder(),
		   	new EmptyBorder(4,4,4,4)
		));
	}

	public void setBackground(Color c)		
	{
		Color bgr = new Color(c.getRed()/255f, c.getGreen()/255f, c.getBlue()/255f, grado);
		super.setBackground(bgr);
	}
	
	
	public void setGrado(float grad)	
	{
		if(grad>=0 && grad<=1)
			grado = grad;
	}
	
	
	public void paintComponent(Graphics g)	
	{
		super.paintComponent(g);
		Dimension dim = getSize();
		pintar(g, dim.width, dim.height);
	}
	
	
	protected void pintar(Graphics g, int w, int h)	
	{
		if(grado > 0)  
		{
			g.setColor(getBackground());
			g.fillRect(0, 0, w, h);
		}
	}
	
	public void Salir()
	{
		this.setVisible(false);
		this.repaint();	
		this.removeAll();
	}
	
}	
