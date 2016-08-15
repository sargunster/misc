using UnityEngine;

public class ExtendedFlycam : MonoBehaviour
{
    public float CameraSensitivity = 150;
    public float MoveSpeed = 50;

    public KeyCode UpKey = KeyCode.LeftShift;
    public KeyCode DownKey = KeyCode.LeftControl;
    public KeyCode UnlockCursorKey = KeyCode.Escape;

    private float _rotationX;
    private float _rotationY;

    private bool _cursorLocked;

    void Start()
    {
        LockCursor();
    }

    void Update()
    {
        if (_cursorLocked)
        {
            _rotationX += Input.GetAxis("Mouse X")*CameraSensitivity*Time.deltaTime;
            _rotationY += Input.GetAxis("Mouse Y")*CameraSensitivity*Time.deltaTime;
            _rotationY = Mathf.Clamp(_rotationY, -90, 90);

            transform.localRotation = Quaternion.AngleAxis(_rotationX, Vector3.up);
            transform.localRotation *= Quaternion.AngleAxis(_rotationY, Vector3.left);

            transform.position += transform.forward*MoveSpeed*Input.GetAxis("Vertical")*Time.deltaTime;
            transform.position += transform.right*MoveSpeed*Input.GetAxis("Horizontal")*Time.deltaTime;

            if (Input.GetKey(UpKey))
            {
                transform.position += transform.up*MoveSpeed*Time.deltaTime;
            }
            if (Input.GetKey(DownKey))
            {
                transform.position -= transform.up*MoveSpeed*Time.deltaTime;
            }

            if (Input.GetKeyDown(UnlockCursorKey))
            {
                UnlockCursor();
            }
        }
        else if (Input.GetMouseButtonDown(0))
        {
            LockCursor();
        }
    }

    private void LockCursor()
    {
        _cursorLocked = true;
        Cursor.lockState = CursorLockMode.Locked;
        Cursor.visible = false;
    }

    private void UnlockCursor()
    {
        _cursorLocked = false;
        Cursor.lockState = CursorLockMode.None;
        Cursor.visible = true;
    }
}
