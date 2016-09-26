//your code here
void setup()
{
	//your code here
	size(500, 500);
}
void draw()
{
	//your code here

}
class NormalParticle
{
	//your code here
	int myColor;
	double dX, dY, dSpeed, dTheta;
	NormalParticle()
	{
		dX = 50;
		dY = 50;
		myColor = color(100, 100, 255);
	}

	void move()
	{
		dX = Math.cos(dTheta) * dSpeed + dX;
		dY = Math.sin(dTheta) * dSpeed + dY;
	}

	void show()
	{
		ellipse((float)dX, (float)dY, 50, 50);
	}
}
interface Particle
{
	//your code here
}
class OddballParticle //uses an interface
{
	//your code here
}
class JumboParticle //uses inheritance
{
	//your code here
}

