# Setting up your own GitHub repository

## Introduction
GitHub repositories are a great way to store and share your code. They are also a great way to collaborate with others. In this exercise, you will set up your own GitHub repository from your training folder.

## Instructions

### Step 1: 2FA
In order to set up your own GitHub repository, you first need to login to GitHub. Go to the user icon and navigate to password and authenticiation. Here you can set up a personal access token. This token will be used to authenticate your repository. This method works with Duo authentication, which you may already use to access your UCD account. Please record your GitHub recovery codes in a safe place. You will need these if you ever lose access to your account.

### Step 2: Set up an SSH key
Next, you need to set up an SSH key. This will allow you to connect to your GitHub repository without having to enter your username and password each time. To do this, go to your GitHub account settings and navigate to SSH and GPG keys. Here you can add a new SSH key. You can generate a new SSH key using the following command:

```bash
ssh-keygen -t ed25519 -C "your_email@example.com"
```
This creates a new SSH key, using the provided email as a label. When you're prompted to "Enter a file in which to save the key", you can press Enter to accept the default file location. Please note that if you created SSH keys previously, ssh-keygen may ask you to rewrite another key, in which case we recommend creating a custom-named SSH key. To do so, type the default file location and replace id_ALGORITHM with your custom key name.

```bash
> Enter file in which to save the key (/c/Users/YOU/.ssh/id_ALGORITHM):[Press enter]
``` 
At the prompt, type a secure passphrase.

```bash
> Enter passphrase (empty for no passphrase): [Type a passphrase]
> Enter same passphrase again: [Type passphrase again]
```	

Now we should add this key to your GitHub account. To do this, you go the file where you have stored the keys. There will be one that is private and one that is public. Go to the settings on your GitHub page and navigate to SSH and GPG keys. Here you can add a new SSH key. You can copy the public key and paste it here. 

Theoretically, you can now work in git on the HPC and 'push' your updates to your github repository. However, you will need to enter your passphrase each time you do this. Record your commands somewhere safe, as you will need to enter them each time youu want to push something to GitHub.. 

```bash
eval `ssh-agent -s`
ssh-add ~/.ssh/id_ed25519
```

### Step 3: Create a new repository
Your GitHub account is probably empty at the moment. You can create a new repository by clicking on the '+' sign in the top right corner. Here you can select 'New repository'. You can give your repository a name and a description. You can also choose to make it public or private.

While this works fine for small repositories, it is not recommended for large repositories. For large repositories, it is recommended to create a repository on the command line. You can do this by navigating to the folder where you want to store your repository and typing the following commands to set up a new repository, add all the files in the folder to the repository, commit the changes and push the changes to the repository.

```bash
git init
git add .
git commit -m "First commit"
git branch -M main
git remote add origin
git push -u origin main
```
What do you thing is the issue with running git push like this? You have been working hard over the past few weeks. You have generated a lot of data. Do you really need to push that onto GitHub? Will it allow you to push all this data online? 

Typicall in research projects we only share the code and perhaps the raw anonymised data on public GitHub repositories. The raw data is usually stored in a different location such as Zenodo or Figshare, which are fantastic as they provide a DOI for your data and encourage open science. 

### Step 4: Create a .gitignore file
You can create a .gitignore file to specify which files you do not want to push to your repository. This is useful for large files and folders that you do not want to push to your repository. You can create a .gitignore file by typing the following command:

```bash
touch .gitignore
```
You can then open the .gitignore file and specify which files you do not want to push to your repository. For example, you can specify that you do not want to push any files with the .csv extension by typing the following command:

```bash
*.csv
```
You can also specify that you do not want to push any files in a specific folder by typing the following command:

```bash
folder/
```
You can also specify that you do not want to push any files in a specific folder with a specific extension by typing the following command:

```bash
folder/*.csv
```

Now try to create your own GitHub repository that we have ignored the large files and folders in the .gitignore file. 

```bash
git add .
git commit -m "Added gitignore file"
git push -u origin main
```

### Step 5: Create a README.md file
You can create a README.md file to provide information about your repository. This is useful for others who want to use your code. You can create a README.md file by typing the following command:

```bash
touch README.md
```
You can then open the README.md file and provide information about your repository. For example, you can provide a description of your repository, instructions on how to use your code, and information about the authors of the code.

Now push this update to your GitHub repository. 

```bash
git add .
git commit -m "Added README file"
git push -u origin main
```

### Step 6: Collaborate with others
You can collaborate with others by adding them as collaborators to your repository. You can do this by navigating to the settings of your repository and selecting 'Manage access'. Here you can add collaborators by typing their GitHub username. You can also specify the level of access that you want to give them. For example, you can give them read access, write access, or admin access.

You can also make your repository private or public. If you make your repository public, anyone can access it. If you make your repository private, only you and the collaborators that you have added can access it.

### Challenge
We talked last week about the importance of open science, documentation and reproducibility. The best way to test your protocol in the dry or wet-lab is to get someone else to try it. This is also true for your code. You should add one person in the group as a collaborator to your repository. They should be able to clone your repository, run your code and provide feedback.
