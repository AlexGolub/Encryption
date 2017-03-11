%{
File: Matrix-Encryption.m
Alex Golub
Encryption using linear algebra 
%}

% User input message
A = input('What is the message? (letters and spaces only): ', 's');
A = upper(A);
A = uint8(A-64);                % Assign the numbers to their proper letters
while mod(length(A), 3) ~= 0    % Make sure we get a matrix with 3 rows
    A(end+1) = 0;
end
A = reshape(A,[],3);            % Create a 3 column matrix
A = transpose(A);               % Turn it into a 3 row matrix
A = double(A);                  % Convert integer elements into double
disp(' ');
disp 'Now we transfer the message into a matrix of numbers by using A-1, B-2, C-3, D-4, E-5, F-6, G-7, H-8, I-9, J-10, K-11, L-12, M-13, N-14, O-15, P-16, Q-17, R-18, S-19, T-20, U-21, V-22, W-23, X-24, Y-35, Z-25, Space-0';
disp 'After assigning the numbers to coresponding letters we get the matrix A';
disp 'A ='
disp(A);                        % display the created matrix


% Input the encoding matrix B
disp(' ');
B = [1 0 2; 0 2 1; 1 1 2];
disp 'We use the encoding matrix B';
disp 'B ='
disp(B);
disp ' det(B) =';
disp(det(B));

% Now we encrypt
disp(' ');
disp 'To encrypt we multiply the encoding matrix B with our unencrypted matrix A';
encryptedA = B*A;                   % Multiply by the encoding matrix B
disp 'After multiplication we get encrypted matrix A';
disp 'encrypted A ='
disp(encryptedA);                   % Display the encrypted matrix A

% Char operations
disp(' ');
disp 'This is how the encrypted matrix A would look like if we were to convert it into real text';
S = reshape(encryptedA.',[],1);                 % Turn the matrix into a single vector
S = char(S+64);                                 % Convert into characters
S = transpose(S);
S = strrep(S, '@', ' ');                        % Make it a proper sentance
fprintf('The encrypted message is: %s\n', S);     % Display the message



% Now we decrypt A
disp(' ');
disp 'To decrypt the encrypted A we multiply the matrix A by the inverse of matrix B';
disp 'Inverse of B =';
disp(inv(B));
decryptedA = inv(B)*encryptedA;     % Multiply by the decoding matrix B
disp 'After the multiplication we get the Decrypted matrix A';
disp 'A =';
disp(decryptedA);                   % Display the decrypted matrix A


% Char operations
disp(' ');
disp 'Now we convert the decrypted matrix A back to the actual text message';
S = reshape(decryptedA.',[],1);                 % Turn the matrix into a single vector
S = char(S+64);                                 % Convert into characters
S = transpose(S);
S = strrep(S, '@', ' ');                        % Make it a proper sentance
disp(' ');
fprintf('The decoded message is: %s\n', S);     % Display the message


