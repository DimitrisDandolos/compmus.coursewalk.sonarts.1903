# Δημιουργία Band Pass Filter με GUI στο Supercollider

## Εισαγωγή

Σκοπός της εργασίας είναι η δημιουργία ενός Band Pass Filter (BPF) στο Supercollider, το οποίο δέχεται ένα σήμα ροζ θόρυβου και το επεξεργάζεται σε 3 περιοχές του συχνοτικού φάσματος. Επίσης, η εργασία περιλαμβάνει την δημιουργία του γραφικού περιβάλλοντος (GUI) για το φίλτρο αυτο. Η δημιουργία του γραφικού περιβάλλοντος εγινέ και αυτή με το Supercollider. 

### Διεξαγωγή Εργασίας
### Δημιουργία του Φίλτρου

Για το φίλτρο, έγινε η δημιουργία ενος SynthDef, το οποίο παράγει ροζ θόρυβο με στερεοφωνική έξοδο. οι παράμετροι της συχνότητας (freq) και της ποιότητας (rq) τέθηκαν ως arguments, για να επιτραπεί η μετέπειτα επιμέρους επεξεργασία τους. Στην συνέχεια, για να μπορει να αναπαραχθεί το SynthDef, γίνεται η δημιουργία ενος Synth, το οποίο ονομάζεται x. 

### Δημιουργία του GUI

  Για την δημιουργία του γραφικού περιβάλλοντος, έγινε η χρήση της εντολής Window, το οποίο ονoμάζεται w. Αυτή η ενέργεια επιτρέπει την δημιουργία του βασικού παράθυρου που θα απεικονίσει τις λειτουργίες του φίλτρου. Με τις παραμέτρους Rect και background δίνονται οι διαστάσεις και το χρώμα του βασικού παράθυρου. 
  Στην συνέχεια, τέθηκαν ως global variables 3 sliders ( ~slider0, ~slider 1, ~slider2), τα οποία επιρρεάζουν το arg freq του SynthDef, το κάθε ένα σε διαφορετική περιοχή του συχνοτικού φάσματος, απο 50-500Hz, 500-6000Hz και 6000-10000Hz. Οι παράμετροι Rect και background εχουν και εδώ εφαρμογή όσο αφορά την τοποθέτηση κάθε slider μέσα στο βασικό παράθυρο και το χρώμα του καθενός. 
  Με τα global variables ~numberBox, ~numberBox1, ~numberBox2, δίνεται η δυνατότητα απεικόνησης της συχνότητας που επιδρά ένα slider, για κάθε πιθανή θέση που μπορεί να βρίσκεται, αλλά και να γίνεται εισαγωγή ενός αριθμού μέσα στο numberBox και το αντίστοιχο slider να πηγαίνει αυτόματα στην τιμή αυτή, αρκεί βέβαια να ειναι μια τιμή η οποία βρίσκεται μέσα στις πιθανές τιμές που μπορεί να πάρει το κάθε slider. 
  Ακόμα, έγινε η δημιουργία ενός knob ( global variable: ~knob), το οποίο ελέγχει την παράμετρο της ποιότητας (Q) και είναι κοινή και για τα 3 sliders. 
  Για την ευκολία της χρήσης του γραφικού περιβάλλοντος, γινεται εισαγωγή δυο Label (freqLabel και QLabel), τα οποία μας πληροφορούν για το τι απεικονίζει το numberBox και τη λειτουργία του knob. 
  Τέλος, με το global variable ~button, έγινε η δημιουργία ενος κουμπιού το οποίο ενεργοποιεί και απενεργοποιεί τον αρχικό συνθετητή (x). Αυτό επιτυχγάνεται θέτοντας 2 states για το Button , ON και OFF, οπού ανοίγει και κλείνει το συνθετητή αντίστοιχα. 

#### Πληροφορίες 
  Για να λειτουργήσει το project μέσα στο περιβάλλον του Supercollider, πρέπει πρώτα να γίνει η εκτέλεση του SynthDef, στη συνέχεια το Synth(x) και τέλος το παράθυρο (w). 
