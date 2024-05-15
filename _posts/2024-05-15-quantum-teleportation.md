---
layout: post
title: "Quantum Teleportation with Qiskit"
description: "Ranting about quantum teleportation and implementing it on Qiskit."
image: assets/images/2024/2024-05-15-quantum-teleportation/quantum-teleportation.png
---

Starting with the disillusion, quantum *teleportation* is not really about actually teleporting stuff from one place to another in the common sense of the word. In fact, I'd rather call it quantum replication, since the point is to replicate the state of a qubit in a different qubit somewhere else using information received from classical channels; meaning that the transfer of information is still bounded by the speed of light. So, if you want to send your hypothetical state to the nearest star, Proxima Centauri, you'd still have to wait about 4 years for the information to get there via this protocol.

Now, I have seen plenty of implementations of a quantum teleportation circuit in several tutorials. Some of them, completely go over the fact that you're *not* supposed to know the state of the qubit you're teleporting at the receiver's end. This means that adding a "disentangler" gate at the end of the circuit that uses information about how you prepared the state in the first place trivializes the whole process.

In short, here's how the quantum teleportation protocol works:

**Encoding**

1. First, you prepare the quantum qubit that you would like to teleport, say $\|\psi\rangle = \alpha \|0\rangle + \beta \|1 \rangle$.
2. You prepare an entangled pair of qubits, one of which you keep with you and the other you send to the receiver.
4. You entangle your qubit and the entangled qubit you have kept with yourself.
3. You measure your qubits. By now, the states have collapsed into two classical bits (00 to 11) and a quantum bit.
4. The bits you have obtained in the previous step are also sent to the receiver, in the form of a string for example (`01`).

**Decoding**

5. The receiver will apply an X gate to his entangled state if he gets a string that begins with 1, and a Z gate if he gets a string that ends with 1.
6. The resulting amplitudes can be recovered via an ensemble method.

Now, an attentious reader would notice that the receiver cannot know what was the phase of the complex coefficients $\alpha$ and $\beta$ were via this protocol. He can merely find you what their absolute values are. The reason for that, is simply because measuring the state $\| \psi \rangle$ give you no information about its phase, only its amplitude squared. To this point, you might argue that we don't end up with the same state at the receiver's end, and that's technically correct, ~~the best kind of correct~~.

With that out of the way, we can start thinking about the actual implementation. We will use the Qiskit library along with Qiskit Aer to simulate the circuit locally. You could, in principle, run this on a real quantum computer via the IBM API, but this code is so simple that it feels wasteful to do so.

# Implementation

{% include notebooks/2024/2024-05-15-quantum-teleportation/quantum-teleportation.md %}

Link to notebook: [Quantum Teleportation]({{site.baseurl}}/assets/notebooks/2024/2024-05-15-quantum-teleportation/quantum-teleportation.ipynb)