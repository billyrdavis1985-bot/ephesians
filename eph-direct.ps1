
# EphesiansPacket v1.0 – OmniBook X (Direct Source)
# Paste into PowerShell (right-click title bar → Edit → Paste)

$verses = @(
    "EPH 6:12 For we wrestle not against flesh and blood, but against principalities, against powers, against the rulers of the darkness of this world.",
    "EPH 6:13 Wherefore take unto you the whole armour of God, that ye may be able to withstand in the evil day.",
    "EPH 6:14 Stand therefore, having your loins girt about with truth, and having on the breastplate of righteousness.",
    "EPH 6:15 And your feet shod with the preparation of the gospel of peace.",
    "EPH 6:16 Above all, taking the shield of faith, wherewith ye shall be able to quench all the fiery darts of the wicked."
)

$packet = 1
while ($true) {
    $verse = $verses | Get-Random
    Write-Host "`n[EPH PACKET $packet] → RELAYED" -ForegroundColor Green
    Write-Host $verse -ForegroundColor Yellow
    $packet++
    Start-Sleep -Seconds 3
}

matrix_rosary.[import pygame
import random
import sys
import time
import socket

pygame.init()
WIDTH, HEIGHT = 720, 1280  # phone portrait or resize for laptop
screen = pygame.display.set_mode((WIDTH, HEIGHT))
pygame.display.set_caption("Matrix-Code Rosary")
clock = pygame.time.Clock()
font = pygame.font.SysFont("couriernew", 24)
smallfont = pygame.font.SysFont("couriernew", 16)

# Your signature katakana + cross
CHARS = "ｴﾌｪｿ6:12＋✝ｦﾉｺﾎﾆﾊﾋﾐﾑﾒﾔﾕﾗﾘｸｹｹｺｻｼｽｾﾀﾂﾃ"
CROSS = "✝"

# Colors
GREEN = (0, 255, 0)
DARKGREEN = (0, 100, 0)
GOLD = (255, 215, 0)
WHITE = (255, 255, 255)

class Drop:
    def __init__(self, x):
        self.x = x
        self.y = random.randint(-HEIGHT, 0)
        self.speed = random.randint(2, 10)
        self.chars = [random.choice(CHARS) for _ in range(20)]
        self.bright = random.randint(100, 255)

    def fall(self):
        self.y += self.speed
        if self.y > HEIGHT:
            self.y = random.randint(-HEIGHT, -50)
            self.speed = random.randint(2, 10)
            self.bright = 255

    def draw(self):
        for i, char in enumerate(self.chars):
            brightness = max(0, self.bright - i * 12)
            color = (0, brightness, 0)
            if i == 0:
                color = (0, 255, 0)
            if char == "✝":
                color = GOLD
            screen.blit(font.render(char, True, color), (self.x, self.y - i * 30))

drops = [Drop(x) for x in range(0, WIDTH, 30)]

# Rosary state
bead = 0
total_beads = 59
decade = 0
packet_sent_this_decade = False

# UDP blessing packet
def send_blessing():
    msg = b"Ephesians 6:12 - Warrior of God was here \xEF\xB8\x8F"
    sock = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    sock.setsockopt(socket.SOL_SOCKET, socket.SO_BROADCAST, 1)
    try:
        sock.sendto(msg, ("255.255.255.255", 1337))
    except:
        pass
    sock.close()

running = True
while running:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            running = False
        if event.type == pygame.KEYDOWN or (event.type == pygame.FINGERDOWN):
            bead += 1
            if bead > total_beads:
                bead = 1
            decade = (bead - 1) // 10
            packet_sent_this_decade = False

    screen.fill((0, 0, 0))

    for drop in drops:
        drop.fall()
        drop.draw()

    # Decade completion flash + packet
    if bead > 0 and bead % 10 == 0 and not packet_sent_this_decade:
        screen.fill(GOLD)
        pygame.display.flip()
        time.sleep(0.3)
        send_blessing()
        packet_sent_this_decade = True

    # Bead counter
    txt = smallfont.render(f"Bead: {bead}/59  Decade: {decade}", True, WHITE)
    screen.blit(txt, (10, 10))
    verse = smallfont.render("Ephesians 6:12", True, GOLD)
    screen.blit(verse, (WIDTH//2 - verse.get_width()//2, HEIGHT - 60))

    pygame.display.flip()
    clock.tick(60)

pygame.quit()
sys.exit()
    
] $PropertyName