//your code here
Particle [] particles;
void setup()
{
	//your code here
	size(500, 500);
	background(0);
	particles = new Particle[50];
	for(int i = 0; i < particles.length; i ++)
	{
		particles[i] = new NormalParticle();
	}
	particles[0] = new OddballParticle();
	for(int i = 1; i < 5; i ++)
	{
		particles[i] = new JumboParticle();		
	}

}
void draw()
{
	//your code here
	background(0);
	for(int i = 0; i < particles.length; i++)
	{
		particles[i].move();
		particles[i].show();		
	}
	particles[0].show();
	particles[1].show();
}

void mousePressed()
{
	for(int i = 0; i < particles.length; i ++)
	{
		particles[i].middle();
	}
}

class NormalParticle implements Particle
{
	//your code here
	int myColor;
	double dX, dY, dSpeed, dTheta;
	NormalParticle()
	{
		dX = 250;
		dY = 250;
		dTheta = Math.random()*(2*Math.PI);
		dSpeed = Math.random()*11;
		myColor = color((int)(Math.random()*255)+100, (int)(Math.random()*255)+100, (int)(Math.random()*255)+100);
	}

	public void move()
	{
		dX = Math.cos(dTheta) * dSpeed + dX;
		dY = Math.sin(dTheta) * dSpeed + dY;
	}

	public void show()
	{
		fill(myColor);
		ellipse((float)dX, (float)dY, 5, 5);
	}

	public void middle()
	{
		dX = 250;
		dY = 250;
	}
}
interface Particle
{
	public void show();
	public void move();
	public void middle();
}
class OddballParticle implements Particle//uses an interface
{
	//your code here
	int dX, dY;
	OddballParticle()
	{
		dX = 100;
	}
	public void show()
	{
		fill(255);
		ellipse(200, 200, 10, 10);
	}

	public void move()
	{

	}

	public void middle()
	{}
}
class JumboParticle extends NormalParticle//uses inheritance
{
	//your code here
	void show()
	{
		fill(myColor);
		ellipse((float)dX, (float)dY, 10, 10);
	}
}

